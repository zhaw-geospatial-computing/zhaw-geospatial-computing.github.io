# Generate exercise images for Paths-and-Flows-2 slides
# Output: public/netzwerkanalyse-r/{routing_snap,shortest_path,catchment,cost_matrix,tsp_tour}.png
#
# Run from the project root:
#   Rscript generate-images-paf2.R

library(sf)
library(sfnetworks)
library(tidygraph)
library(dplyr)
library(ggplot2)
library(TSP)

out <- "public/netzwerkanalyse-r"
dir.create(out, recursive = TRUE, showWarnings = FALSE)

# ── Setup ──────────────────────────────────────────────────────────────────────
streets      <- read_sf("netzwerkanalyse.gpkg", layer = "osm_highway_prepared")
municipality <- read_sf("netzwerkanalyse.gpkg", layer = "Gemeinde_Waedenswil")

net <- as_sfnetwork(streets, directed = FALSE) |>
  activate("edges") |>
  mutate(length = edge_length())

nodes <- st_as_sf(net, "nodes")
edges <- st_as_sf(net, "edges")

locations <- read_sf("routing_locations.gpkg")
loc_idx   <- st_nearest_feature(locations, nodes)
snap_pts  <- nodes[loc_idx, ] |> mutate(name = locations$name)
from_idx  <- loc_idx[locations$name == "Bahnhof"]
to_idx    <- loc_idx[locations$name == "ZHAW Grüntal"]

base <- ggplot() +
  geom_sf(data = municipality, fill = NA, color = "black", linewidth = 0.6) +
  geom_sf(data = edges, color = "gray80", linewidth = 0.2) +
  theme_void()

# ── routing_snap.png ──────────────────────────────────────────────────────────
p <- base +
  geom_sf(data = snap_pts, aes(color = name), size = 3) +
  theme(legend.title = element_blank(), legend.position = "bottom",
        legend.text = element_text(size = 7)) +
  labs(title = "Snapped locations")
ggsave(file.path(out, "routing_snap.png"), p, width = 5, height = 5, dpi = 150)
cat("routing_snap.png done\n")

# ── shortest_path.png ─────────────────────────────────────────────────────────
path_result   <- st_network_paths(net, from = from_idx, to = to_idx, weights = "length")
path_edge_idx <- path_result |> pull(edge_paths) |> unlist()
path_edges    <- net |> activate("edges") |> slice(path_edge_idx) |> st_as_sf()

p <- base +
  geom_sf(data = path_edges, color = "firebrick", linewidth = 1.2) +
  geom_sf(data = snap_pts |> filter(name %in% c("Bahnhof", "ZHAW Grüntal")),
          aes(color = name), size = 3) +
  scale_color_manual(values = c("Bahnhof" = "steelblue", "ZHAW Grüntal" = "firebrick"),
                     name = NULL) +
  labs(title = "Shortest path: Bahnhof → ZHAW Grüntal",
       subtitle = paste0(round(sum(as.numeric(path_edges$length))), " m"))
ggsave(file.path(out, "shortest_path.png"), p, width = 5, height = 5, dpi = 150)
cat("shortest_path.png done\n")

# ── catchment.png ─────────────────────────────────────────────────────────────
costs     <- st_network_cost(net, from = from_idx, weights = "length")
nodes_iso <- nodes |>
  mutate(
    dist_m = as.numeric(costs[1, ]),
    zone   = case_when(
      dist_m <=  500 ~ "≤ 500 m",
      dist_m <= 1000 ~ "≤ 1 000 m",
      dist_m <= 2000 ~ "≤ 2 000 m",
      TRUE           ~ "> 2 000 m"
    ),
    zone = factor(zone, levels = c("≤ 500 m", "≤ 1 000 m", "≤ 2 000 m", "> 2 000 m"))
  )

p <- ggplot() +
  geom_sf(data = municipality, fill = NA, color = "black", linewidth = 0.6) +
  geom_sf(data = nodes_iso |> filter(zone == "> 2 000 m"), color = "gray85", size = 0.3) +
  geom_sf(data = nodes_iso |> filter(zone != "> 2 000 m"), aes(color = zone), size = 0.5) +
  scale_color_manual(
    values = c("≤ 500 m" = "#1a9641", "≤ 1 000 m" = "#a6d96a", "≤ 2 000 m" = "#fdae61"),
    name = "Network distance") +
  geom_sf(data = snap_pts |> filter(name == "Bahnhof"), color = "black", size = 3) +
  theme_void() +
  labs(title = "Catchment area from Wädenswil Bahnhof")
ggsave(file.path(out, "catchment.png"), p, width = 5, height = 5, dpi = 150)
cat("catchment.png done\n")

# ── cost_matrix.png ───────────────────────────────────────────────────────────
cost_mat           <- st_network_cost(net, from = loc_idx, to = loc_idx, weights = "length")
rownames(cost_mat) <- locations$name
colnames(cost_mat) <- locations$name

mat_df <- as.data.frame(as.table(round(units::drop_units(cost_mat))))
names(mat_df) <- c("From", "To", "Distance")

p <- ggplot(mat_df, aes(x = To, y = From, fill = Distance)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(Distance / 1000, 1)), size = 3) +
  scale_fill_viridis_c(option = "plasma", name = "m", direction = -1) +
  theme_minimal(base_size = 10) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
  labs(title = "Pairwise network distances (km)")
ggsave(file.path(out, "cost_matrix.png"), p, width = 5, height = 4.5, dpi = 150)
cat("cost_matrix.png done\n")

# ── tsp_tour.png ──────────────────────────────────────────────────────────────
tour       <- solve_TSP(TSP(units::drop_units(cost_mat)))
tour_order <- as.integer(tour)
from_idxs  <- loc_idx[tour_order]
to_idxs    <- c(from_idxs[-1], from_idxs[1])

tsp_paths <- mapply(
  st_network_paths,
  from = from_idxs, to = to_idxs,
  MoreArgs = list(x = net, weights = "length")
)["edge_paths", ] |> unlist(recursive = FALSE)

tour_edges <- lapply(tsp_paths, function(ep) {
  net |> activate("edges") |> slice(ep) |> st_as_sf()
}) |> bind_rows()

p <- base +
  geom_sf(data = tour_edges, color = "steelblue", linewidth = 1.2) +
  geom_sf(data = snap_pts, color = "firebrick", size = 3) +
  geom_sf_label(data = locations, aes(label = name), size = 2.2, nudge_y = 120) +
  labs(title = "Optimal TSP tour — Wädenswil",
       subtitle = paste0("Total: ", round(tour_length(tour) / 1000, 2), " km"))
ggsave(file.path(out, "tsp_tour.png"), p, width = 5, height = 5, dpi = 150)
cat("tsp_tour.png done\n")

cat("\nAll images written to", out, "\n")
