library(sf)
library(sfnetworks)
library(tidygraph)
library(ggplot2)
library(dplyr)
library(patchwork)

out_dir <- "public/netzwerkanalyse-r"
dir.create(out_dir, showWarnings = FALSE)

# --- Load data ----------------------------------------------------------------

streets      <- read_sf("netzwerkanalyse.gpkg", layer = "osm_highway_prepared")
municipality <- read_sf("netzwerkanalyse.gpkg", layer = "Gemeinde_Waedenswil")

# --- Build network ------------------------------------------------------------

net <- as_sfnetwork(streets, directed = FALSE) |>
  activate("edges") |>
  mutate(length = edge_length()) |>
  activate("nodes") |>
  mutate(
    degree      = centrality_degree(),
    closeness   = centrality_closeness(weights = length),
    betweenness = centrality_betweenness(weights = length)
  )

nodes <- st_as_sf(net, "nodes")
edges <- st_as_sf(net, "edges")

# --- Plot helpers -------------------------------------------------------------

theme_map <- theme_void() +
  theme(legend.position = "bottom",
        legend.key.width = unit(1.5, "cm"))

# --- Task 2: Street network overview -----------------------------------------

p_network <- ggplot() +
  geom_sf(data = municipality, fill = NA, color = "black", linewidth = 0.8) +
  geom_sf(data = streets, color = "steelblue", linewidth = 0.2) +
  theme_void()

ggsave(file.path(out_dir, "strassennetz.png"),
       p_network, width = 5, height = 5, dpi = 150, bg = "white")

# --- Task 5: Degree centrality -----------------------------------------------

p_degree_hist <- ggplot(nodes, aes(x = degree)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "white") +
  labs(x = "Degree", y = "Number of nodes") +
  theme_minimal()

ggsave(file.path(out_dir, "degree_hist.png"),
       p_degree_hist, width = 5, height = 4, dpi = 150, bg = "white")

p_degree_map <- ggplot() +
  geom_sf(data = edges, color = "gray85", linewidth = 0.2) +
  geom_sf(data = nodes, aes(color = degree), size = 0.4) +
  scale_color_viridis_c(option = "plasma", name = "Degree") +
  theme_map

ggsave(file.path(out_dir, "degree_map.png"),
       p_degree_map, width = 5, height = 5, dpi = 150, bg = "white")

# --- Task 6: Closeness centrality --------------------------------------------

p_closeness_map <- ggplot() +
  geom_sf(data = edges, color = "gray85", linewidth = 0.2) +
  geom_sf(data = nodes, aes(color = closeness), size = 0.4) +
  scale_color_viridis_c(option = "magma", name = "Closeness") +
  theme_map

ggsave(file.path(out_dir, "closeness_map.png"),
       p_closeness_map, width = 5, height = 5, dpi = 150, bg = "white")

# --- Task 7: Betweenness centrality ------------------------------------------

p_betweenness_map <- ggplot() +
  geom_sf(data = edges, color = "gray85", linewidth = 0.2) +
  geom_sf(data = nodes, aes(color = betweenness), size = 0.4) +
  scale_color_viridis_c(option = "inferno", name = "Betweenness",
                        transform = "sqrt") +
  theme_map

ggsave(file.path(out_dir, "betweenness_map.png"),
       p_betweenness_map, width = 5, height = 5, dpi = 150, bg = "white")

# --- Task 8: Comparison ------------------------------------------------------

p_comp_degree <- ggplot() +
  geom_sf(data = edges, color = "gray90", linewidth = 0.15) +
  geom_sf(data = nodes, aes(color = degree), size = 0.3) +
  scale_color_viridis_c(option = "plasma", name = "Degree") +
  labs(title = "Degree") +
  theme_map

p_comp_closeness <- ggplot() +
  geom_sf(data = edges, color = "gray90", linewidth = 0.15) +
  geom_sf(data = nodes, aes(color = closeness), size = 0.3) +
  scale_color_viridis_c(option = "magma", name = "Closeness") +
  labs(title = "Closeness") +
  theme_map

p_comp_betweenness <- ggplot() +
  geom_sf(data = edges, color = "gray90", linewidth = 0.15) +
  geom_sf(data = nodes, aes(color = betweenness), size = 0.3) +
  scale_color_viridis_c(option = "inferno", name = "Betweenness",
                        transform = "sqrt") +
  labs(title = "Betweenness") +
  theme_map

p_comparison <- p_comp_degree + p_comp_closeness + p_comp_betweenness

ggsave(file.path(out_dir, "comparison.png"),
       p_comparison, width = 15, height = 5, dpi = 150, bg = "white")
