# dijkstra.R
# Step-by-step visualisation of Dijkstra's shortest-path algorithm.
# Graph: 8 nodes (a–h), starting at b, from Worboys & Duckham (2004).
# Run from project root: Rscript dijkstra.R
# Output: public/dijkstra-{1..6}.png

library(ggplot2)

INF <- Inf

# ── Graph ──────────────────────────────────────────────────────────────────────

nodes <- data.frame(
  name = c("b",  "a",  "c",  "d",  "e",  "h",  "f",  "g"),
  x    = c(3.0,  0.0,  5.5,  3.0,  4.0,  8.0,  1.0,  6.5),
  y    = c(0.0,  3.0,  2.0,  3.5,  5.5,  3.0,  7.5,  7.5),
  stringsAsFactors = FALSE
)
rownames(nodes) <- nodes$name

edges <- data.frame(
  from   = c("b","b","b","a","d","d","c","c","e","e"),
  to     = c("a","c","d","e","c","e","e","h","f","g"),
  weight = c( 20,  8,  9, 15,  6,  7, 15, 10, 22, 18),
  stringsAsFactors = FALSE
)
edges$x    <- nodes[edges$from, "x"]
edges$y    <- nodes[edges$from, "y"]
edges$xend <- nodes[edges$to,   "x"]
edges$yend <- nodes[edges$to,   "y"]
edges$mx   <- (edges$x + edges$xend) / 2
edges$my   <- (edges$y + edges$yend) / 2
edges$key  <- paste(edges$from, edges$to, sep = "-")

# ── Colours ────────────────────────────────────────────────────────────────────

STATUS_FILL <- c(
  unvisited = "#e2e8f0",  # slate-200  — distance unknown
  frontier  = "#93c5fd",  # blue-300   — queued, not yet visited
  updated   = "#2563eb",  # blue-600   — just relaxed this step
  current   = "#f97316",  # orange-500 — being visited now
  visited   = "#16a34a"   # green-600  — distance finalised
)

STATUS_TEXT <- c(
  unvisited = "#475569",
  frontier  = "#1e3a8a",
  updated   = "white",
  current   = "white",
  visited   = "white"
)

# ── Algorithm steps ────────────────────────────────────────────────────────────
# Each step records the full distance vector, a status per node, and which
# edges are actively being relaxed (highlighted in orange).

steps <- list(
  list(
    title  = "Initialise: t(b) = 0, all others = \u221e",
    dist   = c(b=0, a=INF, c=INF, d=INF, e=INF, h=INF, f=INF, g=INF),
    status = c(b="current",  a="unvisited", c="unvisited", d="unvisited",
               e="unvisited", h="unvisited", f="unvisited", g="unvisited"),
    active = character(0)
  ),
  list(
    title  = "Visit b (t=0): update neighbours \u2192 t(a)=20, t(c)=8, t(d)=9",
    dist   = c(b=0, a=20, c=8, d=9, e=INF, h=INF, f=INF, g=INF),
    status = c(b="visited",  a="updated",   c="updated",   d="updated",
               e="unvisited", h="unvisited", f="unvisited", g="unvisited"),
    active = c("b-a", "b-c", "b-d")
  ),
  list(
    title  = "Visit c (t=8, smallest) \u2192 t(e)=23, t(h)=18 \u2014 c\u2192d=14 > 9, d unchanged",
    dist   = c(b=0, a=20, c=8, d=9, e=23, h=18, f=INF, g=INF),
    status = c(b="visited",  a="frontier",  c="current",   d="frontier",
               e="updated",  h="updated",   f="unvisited", g="unvisited"),
    active = c("c-e", "c-h")
  ),
  list(
    title  = "Visit d (t=9): b\u2192d\u2192e = 16 < 23 \u2014 t(e) updated!",
    dist   = c(b=0, a=20, c=8, d=9, e=16, h=18, f=INF, g=INF),
    status = c(b="visited",  a="frontier",  c="visited",   d="current",
               e="updated",  h="frontier",  f="unvisited", g="unvisited"),
    active = c("d-e")
  ),
  list(
    title  = "Visit e (t=16): t(f)=38, t(g)=34",
    dist   = c(b=0, a=20, c=8, d=9, e=16, h=18, f=38, g=34),
    status = c(b="visited",  a="frontier",  c="visited",   d="visited",
               e="current",  h="frontier",  f="updated",   g="updated"),
    active = c("e-f", "e-g")
  ),
  list(
    title  = "All nodes visited \u2014 shortest distances from b found",
    dist   = c(b=0, a=20, c=8, d=9, e=16, h=18, f=38, g=34),
    status = c(b="visited",  a="visited",   c="visited",   d="visited",
               e="visited",  h="visited",   f="visited",   g="visited"),
    active = character(0)
  )
)

# ── Draw function ──────────────────────────────────────────────────────────────

fmt_d <- function(d) ifelse(is.infinite(d), "\u221e", as.character(d))

draw_step <- function(step, i, n = length(steps)) {
  nd        <- nodes
  nd$status <- step$status[nd$name]
  nd$fill   <- STATUS_FILL[nd$status]
  nd$tcol   <- STATUS_TEXT[nd$status]
  nd$dlbl   <- fmt_d(step$dist[nd$name])

  ed      <- edges
  ed$act  <- ed$key %in% step$active

  ggplot() +
    # Inactive edges
    geom_segment(
      data = ed[!ed$act, ],
      aes(x = x, y = y, xend = xend, yend = yend),
      color = "#94a3b8", linewidth = 0.9
    ) +
    # Active (relaxed) edges — orange
    geom_segment(
      data = ed[ed$act, ],
      aes(x = x, y = y, xend = xend, yend = yend),
      color = "#f97316", linewidth = 2.2, lineend = "round"
    ) +
    # Edge weight labels
    geom_label(
      data = ed,
      aes(x = mx, y = my, label = weight),
      size = 3.0, label.padding = unit(0.12, "lines"), label.size = 0.2,
      fill = "white", color = "#475569"
    ) +
    # Node circles
    geom_point(
      data = nd,
      aes(x = x, y = y, fill = I(fill)),
      shape = 21, size = 16, stroke = 1.5, color = "white"
    ) +
    # Node letter (upper half of circle)
    geom_text(
      data = nd,
      aes(x = x, y = y + 0.22, label = name, color = I(tcol)),
      size = 4.2, fontface = "bold"
    ) +
    # Current distance (lower half of circle)
    geom_text(
      data = nd,
      aes(x = x, y = y - 0.28, label = dlbl, color = I(tcol)),
      size = 3.1
    ) +
    # Step counter + title
    labs(title = paste0("Step ", i, "/", n, " \u2014 ", step$title)) +
    coord_equal(xlim = c(-1.2, 10.2), ylim = c(-1.5, 9.0)) +
    theme_void(base_size = 12) +
    theme(
      plot.title      = element_text(
        size   = 10, color = "#1e293b", hjust = 0,
        margin = margin(b = 4, l = 6)
      ),
      plot.background = element_rect(fill = "transparent", color = NA),
      plot.margin     = margin(6, 8, 6, 8)
    )
}

# ── Save frames ────────────────────────────────────────────────────────────────

dir.create("public", showWarnings = FALSE)

for (i in seq_along(steps)) {
  p     <- draw_step(steps[[i]], i)
  fname <- sprintf("public/dijkstra-%d.png", i)
  ggsave(fname, p, width = 6, height = 5.2, dpi = 300, bg = "transparent")
  message("Written: ", fname)
}

message("Done — ", length(steps), " frames saved to public/.")
