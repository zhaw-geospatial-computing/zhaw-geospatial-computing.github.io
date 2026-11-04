# graph-type-figures.R
# Creates small illustration images for the Graphen-Typen table in Paths-and-Flows-1.md
# Run from project root (Modul-Geospatial-Computing/):
#   Rscript graph-type-figures.R

library(igraph)
library(ggraph)
library(ggplot2)

out <- "public/graph-types"
dir.create(out, showWarnings = FALSE, recursive = TRUE)

# ── Shared defaults ────────────────────────────────────────────────────────────
vargs <- list(
  vertex.color = "white",
  vertex.frame.color = "black",
  vertex.frame.width = 2,
  vertex.size = 22,
  vertex.label = NA
)

eargs <- list(
  edge.color = "black",
  edge.width = 2.2,
  edge.arrow.size = 0.55,
  edge.curved = 0
)

gplot <- function(g, lay, ...) {
  # modifyList lets ... override defaults in vargs/eargs
  args <- modifyList(c(vargs, eargs), list(...))
  do.call(plot, c(list(g, layout = lay), args))
}

open_png <- function(file, w = 250, h = 250) {
  png(file.path(out, file), width = w, height = h, bg = "transparent")
  par(mar = c(0.3, 0.3, 0.3, 0.3))
}

# ── 1. Zyklisch ───────────────────────────────────────────────────────────────
# A directed 4-cycle (square): every node is on the cycle.
# Clearly shows "erster und letzter Knoten identisch".
g_z <- graph_from_edgelist(
  rbind(c(1, 2), c(2, 3), c(3, 4), c(4, 1)),
  directed = TRUE
)
lay_z <- rbind(c(-1, 1), c(1, 1), c(1, -1), c(-1, -1))

open_png("zyklisch.png")
gplot(g_z, lay_z)
dev.off()

# ── 2. Gerichtet ──────────────────────────────────────────────────────────────
# Directed acyclic graph (DAG): arrows point one way, no closed loop.
g_d <- graph_from_edgelist(
  rbind(c(1, 2), c(1, 3), c(2, 4), c(3, 4), c(4, 5)),
  directed = TRUE
)
lay_d <- rbind(
  c(0.0, 1.0), # 1 – top
  c(-0.8, 0.3), # 2 – left
  c(0.8, 0.3), # 3 – right
  c(0.0, -0.4), # 4 – centre-bottom
  c(0.0, -1.1) # 5 – bottom
)

open_png("gerichtet.png")
gplot(g_d, lay_d, edge.arrow.size = 1.6, edge.arrow.width = 2.5)
dev.off()

# ── 3. Gewichtet ──────────────────────────────────────────────────────────────
# Same topology as gerichtet; edge thickness ∝ weight, labels show values.
g_w <- graph_from_edgelist(
  rbind(c(1, 2), c(1, 3), c(2, 4), c(3, 4), c(4, 5)),
  directed = TRUE
)
w <- c(60, 120, 80, 140, 200)

open_png("gewichtet.png")
do.call(
  plot,
  c(
    list(g_w, layout = lay_d),
    vargs,
    list(
      edge.color = "black",
      edge.width = (w - 40) / 20, # scale: 60→1.0, 80→2.0, 120→4.0, 200→8.0
      edge.label = w,
      edge.label.cex = 0.65,
      edge.label.color = "black",
      edge.arrow.size = 0.4,
      edge.curved = 0
    )
  )
)
dev.off()

# ── 4. Planar ─────────────────────────────────────────────────────────────────
# Left: K4 – complete graph on 4 nodes (planar, can be drawn without crossings)  ✓
# Right: K5 – complete graph on 5 nodes (non-planar, always has crossings)       ✗
g_k4 <- make_full_graph(4, directed = FALSE)
g_k5 <- make_full_graph(5, directed = FALSE)

# Place the inner K4 node at centre to show it can be drawn without crossings
lay_k4 <- rbind(c(0, 1), c(-1, -0.5), c(1, -0.5), c(0, 0))

open_png("planar.png", w = 500, h = 270)
par(mfrow = c(1, 2), mar = c(2.2, 0.1, 0.1, 0.1), oma = c(0, 0, 0, 0))

do.call(
  plot,
  c(
    list(g_k4, layout = lay_k4),
    vargs,
    list(edge.color = "black", edge.width = 2.2)
  )
)
mtext("\u2713", side = 1, col = "#1a7a1a", cex = 2.8, line = 0.5, font = 2)

do.call(
  plot,
  c(
    list(g_k5, layout = layout_in_circle(g_k5)),
    vargs,
    list(edge.color = "black", edge.width = 2.2)
  )
)
mtext("\u2717", side = 1, col = "#cc2222", cex = 2.8, line = 0.5, font = 2)

par(mfrow = c(1, 1))
dev.off()

# ── 5. Hierarchisch ───────────────────────────────────────────────────────────
# Binary tree; labels show structural roles (Wurzel / Eltern / Kind).
g_h <- make_tree(7, children = 2, mode = "undirected")
V(g_h)$label <- c("Wurzel", "Eltern", "Eltern", "Kind", "Kind", "Kind", "Kind")

open_png("hierarchisch.png", w = 310, h = 250)
plot(
  g_h,
  layout = layout_as_tree(g_h, root = 1, flip.y = TRUE),
  vertex.color = "white",
  vertex.frame.color = "black",
  vertex.frame.width = 2,
  vertex.size = 22,
  vertex.label = V(g_h)$label,
  vertex.label.cex = 0.55,
  vertex.label.color = "black",
  edge.color = "black",
  edge.width = 2.2,
  edge.arrow.size = 0
)
dev.off()

# ── Knotengrade (ggraph) ──────────────────────────────────────────────────────
pos <- data.frame(
  name = c("A", "B", "C", "D"),
  x = c(-1, -1, 1, 1),
  y = c(1, -1, -1, 1)
)
get_lay <- function(g) pos[match(V(g)$name, pos$name), c("x", "y")]

# ── 6a. Ungerichteter Graph ───────────────────────────────────────────────────
# Multigraph: A-D, B-A(×2), B-B(loop), B-C, D-B, D-C → degrees A=3, B=6, C=2, D=3
g_u <- graph_from_edgelist(rbind(
  c("A", "D"),
  c("B", "A"),
  c("B", "A"),
  c("B", "B"),
  c("B", "C"),
  c("D", "B"),
  c("D", "C")
), directed = FALSE)
l_u <- get_lay(g_u)

p_u <- ggraph(g_u, layout = "manual", x = l_u$x, y = l_u$y) +
  geom_edge_fan(color = "black", linewidth = 0.9) +
  geom_edge_loop(
    aes(strength = 1.5, span = 100, direction = 225),
    color = "black",
    linewidth = 0.9
  ) +
  geom_node_point(
    shape = 21,
    size = 12,
    fill = "white",
    color = "black",
    stroke = 1.5
  ) +
  geom_node_text(aes(label = name), fontface = "italic", size = 4.2) +
  annotate(
    "text",
    x = c(-1.55, -1.55, 1.55, 1.55),
    y = c(1.55, -1.55, -1.55, 1.55),
    label = c("3", "?", "2", "3"),
    fontface = "bold",
    size = 7
  ) +
  coord_fixed(xlim = c(-2.1, 2.1), ylim = c(-2.1, 2.1)) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "transparent", color = NA),
    plot.margin = margin(4, 4, 4, 4)
  )

ggsave(
  file.path(out, "knotengrad-ungerichtet.png"),
  p_u,
  width = 6,
  height = 6,
  dpi = 300,
  bg = "transparent"
)

# ── 6b. Gerichteter Graph ─────────────────────────────────────────────────────
# Edges: A→D, B→A(×2), B→B(loop), B→C, D→B, D→C
# indegree  A=2, B=2(incl.loop), C=2, D=1
# outdegree A=1, B=4(incl.loop), C=0, D=2  – B shown as "?"
g_dir <- graph_from_edgelist(rbind(
  c("A", "D"),
  c("B", "A"),
  c("B", "A"),
  c("B", "B"),
  c("B", "C"),
  c("D", "B"),
  c("D", "C")
), directed = TRUE)
l_dir <- get_lay(g_dir)

# Label anchor positions: outer side of each corner (A, B, C, D order)
io_x <- c(-1.65, -1.65, 1.65, 1.65)
io_y <- c(1.0, -1.0, -1.0, 1.0)

p_dir <- ggraph(g_dir, layout = "manual", x = l_dir$x, y = l_dir$y) +
  geom_edge_fan(
    arrow = arrow(length = unit(3, "mm"), type = "closed"),
    end_cap = circle(4, "mm"),
    start_cap = circle(4, "mm"),
    color = "black",
    linewidth = 0.7
  ) +
  geom_edge_loop(
    aes(strength = 1.5, span = 100, direction = 225),
    arrow = arrow(length = unit(3, "mm"), type = "closed"),
    end_cap = circle(4, "mm"),
    color = "black",
    linewidth = 0.7
  ) +
  geom_node_point(
    shape = 21,
    size = 12,
    fill = "white",
    color = "black",
    stroke = 1.5
  ) +
  geom_node_text(aes(label = name), fontface = "italic", size = 4.2) +
  # indegree (green, above anchor)
  annotate(
    "text",
    x = io_x,
    y = io_y + 0.3,
    label = c("2", "?", "2", "1"),
    color = "#1a7a1a",
    fontface = "bold",
    size = 6
  ) +
  # outdegree (red, below anchor)
  annotate(
    "text",
    x = io_x,
    y = io_y - 0.3,
    label = c("1", "?", "0", "2"),
    color = "#cc2222",
    fontface = "bold",
    size = 6
  ) +
  # legend below graph (stacked vertically)
  annotate(
    "text",
    x = 0,
    y = -1.82,
    label = "indegree",
    color = "#1a7a1a",
    fontface = "bold",
    size = 4.5
  ) +
  annotate(
    "text",
    x = 0,
    y = -2.05,
    label = "outdegree",
    color = "#cc2222",
    fontface = "bold",
    size = 4.5
  ) +
  coord_fixed(xlim = c(-2.3, 2.3), ylim = c(-2.3, 1.8)) +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "transparent", color = NA),
    plot.margin = margin(4, 4, 4, 4)
  )

ggsave(
  file.path(out, "knotengrad-gerichtet.png"),
  p_dir,
  width = 6,
  height = 3.6,
  dpi = 300,
  bg = "transparent"
)

# ── 7. Adjazenzmatrix ─────────────────────────────────────────────────────────
nodes_abcde <- c("a", "b", "c", "d", "e")

# Graph: triangle a-b-c plus chain b-d-e
g_adj <- graph_from_edgelist(rbind(
  c("a", "b"),
  c("a", "c"),
  c("b", "c"),
  c("b", "d"),
  c("d", "e")
), directed = FALSE)

# Layout matching reference image
lay_adj <- data.frame(
  name = c("a", "b", "c", "d", "e"),
  x    = c(-0.9,  0.4, -0.9,  0.5, -0.1),
  y    = c( 1.0,  0.7,  0.0,  0.2, -0.8)
)
l_adj <- lay_adj[match(V(g_adj)$name, lay_adj$name), c("x", "y")]

# Helper: build adjacency matrix ggplot
# expand.grid(nach, von): nach cycles fastest (rows), von slowest (cols)
# as.vector(mat) is column-major → perfectly aligns with expand.grid order
make_adj_plot <- function(mat, nodes) {
  df <- expand.grid(nach = nodes, von = nodes)
  df$value    <- as.vector(mat)
  df$diagonal <- df$nach == df$von
  df$von  <- factor(df$von,  levels = nodes)
  df$nach <- factor(df$nach, levels = rev(nodes))

  ggplot(df, aes(x = von, y = nach)) +
    geom_tile(fill = "#dce8f0", color = "white", linewidth = 1.3) +
    geom_text(aes(label = value, color = diagonal), size = 5.2, fontface = "bold") +
    scale_color_manual(values = c("FALSE" = "black", "TRUE" = "#2a8a2a"), guide = "none") +
    scale_x_discrete(position = "top") +
    labs(x = "von", y = "nach") +
    theme_minimal(base_size = 13) +
    theme(
      axis.title.x.top  = element_text(color = "orange", face = "bold", size = 14, vjust = -0.5),
      axis.title.y.left = element_text(color = "orange", face = "bold", size = 14, angle = 90),
      axis.text.x       = element_text(face = "bold", size = 12),
      axis.text.y       = element_text(face = "bold", size = 12),
      panel.grid        = element_blank(),
      panel.background  = element_rect(fill = "#dce8f0", color = NA),
      plot.background   = element_rect(fill = "transparent", color = NA),
      plot.margin       = margin(5, 10, 5, 5)
    )
}

# ── 7a. Graph (ungewichtet) ───────────────────────────────────────────────────
p_adj_g <- ggraph(g_adj, layout = "manual", x = l_adj$x, y = l_adj$y) +
  geom_edge_link(color = "black", linewidth = 1.2) +
  geom_node_point(shape = 21, size = 9, fill = "white", color = "black", stroke = 1.3) +
  geom_node_text(aes(label = name), fontface = "italic", size = 3.8) +
  coord_fixed(xlim = c(-1.5, 1.2), ylim = c(-1.3, 1.4)) +
  theme_void() +
  theme(plot.background = element_rect(fill = "transparent", color = NA))

ggsave(file.path(out, "adjazenz-graph.png"), p_adj_g,
       width = 2.5, height = 2.8, dpi = 120, bg = "transparent")

# ── 7b. Adjacency matrix (ungewichtet) ────────────────────────────────────────
# Symmetric; diagonal = 1 (self-loops) to match reference image
adj_mat <- matrix(c(
  1, 1, 1, 0, 0,
  1, 1, 1, 1, 0,
  1, 1, 1, 0, 0,
  0, 1, 0, 1, 1,
  0, 0, 0, 1, 1
), nrow = 5, byrow = TRUE, dimnames = list(nodes_abcde, nodes_abcde))

ggsave(file.path(out, "adjazenz-matrix.png"), make_adj_plot(adj_mat, nodes_abcde),
       width = 3.2, height = 3.0, dpi = 120, bg = "transparent")

# ── 7c. Graph (gewichtet) ─────────────────────────────────────────────────────
# Same topology; edge width ∝ weight, labels show values
g_adj_w <- g_adj
E(g_adj_w)$weight <- c(3, 2, 5, 4, 1)  # a-b, a-c, b-c, b-d, d-e

p_adj_gw <- ggraph(g_adj_w, layout = "manual", x = l_adj$x, y = l_adj$y) +
  geom_edge_link(
    aes(width = weight, label = weight),
    color        = "black",
    label_colour = "black",
    label_size   = 3.5,
    angle_calc   = "along",
    label_dodge  = unit(3.5, "mm")
  ) +
  scale_edge_width(range = c(0.5, 3.5), guide = "none") +
  geom_node_point(shape = 21, size = 9, fill = "white", color = "black", stroke = 1.3) +
  geom_node_text(aes(label = name), fontface = "italic", size = 3.8) +
  coord_fixed(xlim = c(-1.5, 1.2), ylim = c(-1.3, 1.4)) +
  theme_void() +
  theme(plot.background = element_rect(fill = "transparent", color = NA))

ggsave(file.path(out, "adjazenz-graph-gewichtet.png"), p_adj_gw,
       width = 2.5, height = 2.8, dpi = 120, bg = "transparent")

# ── 7d. Adjacency matrix (gewichtet) ─────────────────────────────────────────
# Diagonal = 0 (no self-loops); off-diagonal = edge weights
adj_mat_w <- matrix(c(
  0, 3, 2, 0, 0,
  3, 0, 5, 4, 0,
  2, 5, 0, 0, 0,
  0, 4, 0, 0, 1,
  0, 0, 0, 1, 0
), nrow = 5, byrow = TRUE, dimnames = list(nodes_abcde, nodes_abcde))

ggsave(file.path(out, "adjazenz-matrix-gewichtet.png"), make_adj_plot(adj_mat_w, nodes_abcde),
       width = 3.2, height = 3.0, dpi = 120, bg = "transparent")

message("Done. Images written to: ", out)
