# douglas-peucker.R
# Creates 5 figures for the Douglas-Peucker line simplification algorithm.
# The algorithm is shown level-by-level (breadth-first): start with the
# coarsest simplification (start-to-end), then progressively add the most
# deviant point at each level.
# Run from project root: Rscript douglas-peucker.R
# Output: public/douglas-peucker-{1..5}.png

library(ggplot2)

# ── Original polyline ──────────────────────────────────────────────────────────
pts <- data.frame(
  x = c(0,  1,   2,   3,  4,   5,   6,   7,   8,   9,  10),
  y = c(2,  3.5, 2.5, 5,  3.5, 4.5, 2.5, 4,   3,   4.5, 2)
)
n <- nrow(pts)

# ── Geometry helpers ───────────────────────────────────────────────────────────
perp_dist <- function(px, py, x1, y1, x2, y2) {
  dx <- x2 - x1; dy <- y2 - y1
  len <- sqrt(dx^2 + dy^2)
  if (len < 1e-10) return(sqrt((px - x1)^2 + (py - y1)^2))
  abs((px - x1) * dy - (py - y1) * dx) / len
}

foot_perp <- function(px, py, x1, y1, x2, y2) {
  dx <- x2 - x1; dy <- y2 - y1
  t  <- ((px - x1) * dx + (py - y1) * dy) / (dx^2 + dy^2)
  c(x1 + t * dx, y1 + t * dy)
}

most_deviant <- function(pts, i, j) {
  if (j - i <= 1L) return(list(k = NA_integer_, d = 0))
  best_d <- -1; best_k <- i
  for (k in (i + 1L):(j - 1L)) {
    d <- perp_dist(pts$x[k], pts$y[k], pts$x[i], pts$y[i], pts$x[j], pts$y[j])
    if (d > best_d) { best_d <- d; best_k <- k }
  }
  list(k = best_k, d = best_d)
}

# ── Breadth-first D-P — one snapshot per level ────────────────────────────────
dp_snapshots <- function(pts, epsilon) {
  n     <- nrow(pts)
  kept  <- c(1L, n)
  snaps <- list(kept)
  queue <- list(c(1L, n))

  repeat {
    if (!length(queue)) break
    nq <- list(); added <- FALSE
    for (seg in queue) {
      res <- most_deviant(pts, seg[1], seg[2])
      if (!is.na(res$k) && res$d > epsilon) {
        kept  <- sort(c(kept, res$k)); added <- TRUE
        if (res$k - seg[1] > 1L) nq <- c(nq, list(c(seg[1], res$k)))
        if (seg[2] - res$k > 1L) nq <- c(nq, list(c(res$k, seg[2])))
      }
    }
    if (added) snaps <- c(snaps, list(kept))
    queue <- nq
    if (!added && !length(queue)) break
  }
  snaps
}

EPSILON <- 1.0
snaps   <- dp_snapshots(pts, EPSILON)
ns      <- length(snaps)

# Most-deviant point from the initial start-end line (used in frame 2)
md     <- most_deviant(pts, 1L, n)
k_star <- md$k
f_star <- foot_perp(pts$x[k_star], pts$y[k_star],
                    pts$x[1], pts$y[1], pts$x[n], pts$y[n])

# ── Plot factory ───────────────────────────────────────────────────────────────
XLIM <- c(-0.3, 10.3)
YLIM <- c(1.2,  5.8)

draw_frame <- function(kept, show_perp = FALSE) {
  simp <- pts[kept, ]

  p <- ggplot() +
    # Original line — gray, always visible
    geom_path(data = pts,  aes(x = x, y = y),
              color = "#94a3b8", linewidth = 0.8) +
    geom_point(data = pts, aes(x = x, y = y),
               color = "#94a3b8", size = 2) +
    # Simplified line — blue
    geom_path(data = simp,  aes(x = x, y = y),
              color = "#1d4ed8", linewidth = 1.8) +
    geom_point(data = simp, aes(x = x, y = y),
               shape = 21, size = 3.8,
               fill = "white", color = "#1d4ed8", stroke = 1.8)

  if (show_perp) {
    # Foot-of-perpendicular marker on the simplified line
    foot_df <- data.frame(x = f_star[1], y = f_star[2])
    # Perpendicular dashed drop line
    p <- p +
      annotate("segment",
               x = pts$x[k_star], y = pts$y[k_star],
               xend = f_star[1],  yend = f_star[2],
               linetype = "dashed", color = "#dc2626", linewidth = 1.0) +
      geom_point(data = foot_df, aes(x = x, y = y),
                 shape = 4, size = 3.5, color = "#dc2626", stroke = 1.5) +
      geom_point(data = pts[k_star, ], aes(x = x, y = y),
                 shape = 21, size = 5,
                 fill = "#fca5a5", color = "#dc2626", stroke = 1.8) +
      annotate("label",
               x         = f_star[1] + 0.8,
               y         = (pts$y[k_star] + f_star[2]) / 2,
               label     = paste0("d = ", round(md$d, 1)),
               color     = "#dc2626",
               fill      = "white",
               label.size = 0.2,
               size      = 4,
               fontface  = "bold")
  }

  p +
    coord_equal(xlim = XLIM, ylim = YLIM) +
    theme_void() +
    theme(
      plot.background = element_rect(fill = "transparent", color = NA),
      plot.margin     = margin(6, 6, 6, 6)
    )
}

# ── 5 frames ───────────────────────────────────────────────────────────────────
# 1. Start-to-end only (coarsest simplification)
# 2. Same + perpendicular showing most-deviant point
# 3. After level-1 split (most-deviant point added)
# 4. After level-2 splits
# 5. Final result
frames <- list(
  list(kept = snaps[[1]],           perp = FALSE),
  list(kept = snaps[[1]],           perp = TRUE),
  list(kept = snaps[[min(2, ns)]], perp = FALSE),
  list(kept = snaps[[min(3, ns)]], perp = FALSE),
  list(kept = snaps[[ns]],          perp = FALSE)
)

dir.create("public", showWarnings = FALSE)

for (i in seq_along(frames)) {
  fr    <- frames[[i]]
  p     <- draw_frame(fr$kept, fr$perp)
  fname <- sprintf("public/douglas-peucker-%d.png", i)
  ggsave(fname, p, width = 5, height = 2.8, dpi = 300, bg = "transparent")
  message("Written: ", fname)
}

message("Done. (", ns, " D-P levels)")
