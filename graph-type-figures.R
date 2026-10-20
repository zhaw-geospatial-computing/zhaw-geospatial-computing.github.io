# graph-type-figures.R
# Creates small illustration images for the Graphen-Typen table in Paths-and-Flows-1.md
# Run from project root (Modul-Geospatial-Computing/):
#   Rscript graph-type-figures.R

library(igraph)

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

# ── Knotengrade ───────────────────────────────────────────────────────────────
# Helper: build layout matrix keyed by vertex name so vertex order doesn't matter
named_layout <- function(g, pos_list) {
  matrix(unlist(pos_list[V(g)$name]), ncol = 2, byrow = TRUE)
}
# Desired corner positions (name → coords)
pos <- list(A = c(-1, 1), B = c(-1, -1), C = c(1, -1), D = c(1, 1))

# ── 6a. Ungerichteter Graph ───────────────────────────────────────────────────
# Multigraph: A-B (×2), A-D, B-C, B-D, B-B (loop), C-D → degrees A=3,B=6,C=2,D=3
g_u <- graph_from_edgelist(
  matrix(
    c("A", "B", "A", "B", "A", "D", "B", "C", "B", "D", "B", "B", "C", "D"),
    ncol = 2,
    byrow = TRUE
  ),
  directed = FALSE
)
lay_u <- named_layout(g_u, pos)

open_png("knotengrad-ungerichtet.png", w = 300, h = 300)
plot(
  g_u,
  layout = lay_u,
  xlim = c(-1.5, 1.5),
  ylim = c(-1.5, 1.5),
  vertex.color = "white",
  vertex.frame.color = "black",
  vertex.frame.width = 2,
  vertex.size = 22,
  vertex.label = V(g_u)$name,
  vertex.label.cex = 1.0,
  vertex.label.color = "black",
  edge.color = "black",
  edge.width = 2,
  edge.curved = 0.3
)
# Degree labels: placed diagonally outside each corner
deg <- c(A = 3, B = 6, C = 2, D = 3)
corner <- list(A = c(-1, 1), B = c(-1, -1), C = c(1, -1), D = c(1, 1))
for (v in names(deg)) {
  text(
    corner[[v]][1] * 1.3,
    corner[[v]][2] * 1.3,
    labels = deg[v],
    cex = 1.3,
    font = 2
  )
}
dev.off()

# ── 6b. Gerichteter Graph ─────────────────────────────────────────────────────
# Edges: A→C, B→A, B→B (loop), B→C, B→D, D→A, D→B
# indegree:  A=2, B=2 (incl. loop), C=2, D=1
# outdegree: A=1, B=4 (incl. loop), C=0, D=2
# B shown as "?" – students calculate from the visible arrows
g_dir <- graph_from_edgelist(
  matrix(
    c("A", "C", "B", "A", "B", "B", "B", "C", "B", "D", "D", "A", "D", "B"),
    ncol = 2,
    byrow = TRUE
  ),
  directed = TRUE
)
lay_dir <- named_layout(g_dir, pos)

open_png("knotengrad-gerichtet.png", w = 300, h = 320)
par(mar = c(3.0, 0.3, 0.3, 0.3)) # extra bottom margin for legend

plot(
  g_dir,
  layout = lay_dir,
  xlim = c(-1.6, 1.6),
  ylim = c(-1.4, 1.4),
  vertex.color = "white",
  vertex.frame.color = "black",
  vertex.frame.width = 2,
  vertex.size = 22,
  vertex.label = V(g_dir)$name,
  vertex.label.cex = 1.0,
  vertex.label.color = "black",
  edge.color = "black",
  edge.width = 2,
  edge.arrow.size = 0.6,
  edge.curved = 0.3
)
# indegree (green) and outdegree (red) labels per corner; B = "?" (student exercise)
ind_lab <- c(A = "2", B = "?", C = "2", D = "1")
outd_lab <- c(A = "1", B = "?", C = "0", D = "2")
for (v in names(ind_lab)) {
  lx <- corner[[v]][1] * 1.45
  ly <- corner[[v]][2] * 1.25
  text(lx, ly + 0.18, ind_lab[v], col = "#1a7a1a", cex = 1.1, font = 2)
  text(lx, ly - 0.18, outd_lab[v], col = "#cc2222", cex = 1.1, font = 2)
}
# Bottom legend (in the extra bottom margin)
mtext(
  "indegree",
  side = 1,
  line = 0.5,
  col = "#1a7a1a",
  font = 2,
  cex = 0.85,
  adj = 0.3
)
mtext(
  "outdegree",
  side = 1,
  line = 0.5,
  col = "#cc2222",
  font = 2,
  cex = 0.85,
  adj = 0.7
)
dev.off()

message("Done. Images written to: ", out)
