# point-in-polygon.R
# Creates 5 figures illustrating the ray casting point-in-polygon test.
# All figures use the same Π-shaped (U-shaped) concave polygon; only the
# test point position changes, producing 0–4 boundary crossings.
#
# Run from project root (Modul-Geospatial-Computing/):
#   Rscript point-in-polygon.R
#
# Output: public/point-in-polygon-ray-{1..5}.png

library(ggplot2)

# ── Polygon ────────────────────────────────────────────────────────────────────
# Π-shape (U-shape, opening at top-centre, counter-clockwise)
# Interior: left arm (x=1–3, y=3–5) + right arm (x=4–5, y=3–5) + base (x=1–5, y=1–3)
# Notch (outside): x=3–4, y=3–5
poly_x <- c(1, 5, 5, 4, 4, 3, 3, 1)
poly_y <- c(1, 1, 5, 5, 3, 3, 5, 5)
poly_df <- data.frame(x = poly_x, y = poly_y)

# ── Ray casting ────────────────────────────────────────────────────────────────
# Cast a horizontal ray from (px, py) rightward.
# Returns sorted x-coordinates of all boundary crossings to the right of px.
ray_hits <- function(px, py, vx, vy) {
  n  <- length(vx)
  xs <- numeric(0)
  for (i in seq_len(n)) {
    j  <- i %% n + 1
    x1 <- vx[i]; y1 <- vy[i]
    x2 <- vx[j]; y2 <- vy[j]
    dy <- y2 - y1
    if (abs(dy) < 1e-10) next       # skip horizontal edges
    t  <- (py - y1) / dy
    if (t < 0 || t >= 1) next       # outside edge span
    xi <- x1 + t * (x2 - x1)
    if (xi > px) xs <- c(xs, xi)    # only crossings to the right
  }
  sort(xs)
}

# ── Scenarios ──────────────────────────────────────────────────────────────────
# Point positions and expected crossing counts:
#   (2,  6)  above polygon         → 0 crossings → outside
#   (2,  2)  inside base           → 1 crossing  → inside
#   (3.5,4)  inside notch          → 2 crossings → outside
#   (2,  4)  inside left arm       → 3 crossings → inside
#   (0,  4)  outside (left)        → 4 crossings → outside
scenarios <- list(
  list(idx = 1, px = 2,   py = 6,   desc = "0 intersections  \u2192  outside"),
  list(idx = 2, px = 2,   py = 2,   desc = "1 intersection   \u2192  inside"),
  list(idx = 3, px = 3.5, py = 4,   desc = "2 intersections  \u2192  outside"),
  list(idx = 4, px = 2,   py = 4,   desc = "3 intersections  \u2192  inside"),
  list(idx = 5, px = 0,   py = 4,   desc = "4 intersections  \u2192  outside")
)

XMIN    <- -1.0
XMAX    <-  7.0
YMIN    <-  0.0
YMAX    <-  7.0
RAY_END <-  6.5

dir.create("public", showWarnings = FALSE)

for (sc in scenarios) {
  px     <- sc$px
  py     <- sc$py
  xi     <- ray_hits(px, py, poly_x, poly_y)
  ni     <- length(xi)
  inside <- (ni %% 2L) == 1L

  lbl_col  <- if (inside) "#166534" else "#991b1b"
  lbl_fill <- if (inside) "#dcfce7"  else "#fee2e2"

  p <- ggplot() +
    # Polygon fill + border
    geom_polygon(
      data = poly_df, aes(x = x, y = y),
      fill = "#dbeafe", color = "#1e40af", linewidth = 1.2
    ) +
    # Ray (from test point to right)
    annotate(
      "segment",
      x = px, y = py, xend = RAY_END, yend = py,
      color = "#ef4444", linewidth = 0.9,
      arrow = arrow(length = unit(3, "mm"), type = "closed")
    ) +
    # Test point P
    geom_point(
      data = data.frame(x = px, y = py), aes(x = x, y = y),
      shape = 21, size = 5, fill = "#ef4444", color = "white", stroke = 1.5
    ) +
    annotate(
      "text", x = px, y = py + 0.48, label = "P",
      color = "#ef4444", size = 4, fontface = "bold"
    )

  # Intersection markers (yellow circles numbered left-to-right)
  if (ni > 0) {
    int_df <- data.frame(x = xi, y = py, num = as.character(seq_len(ni)))
    p <- p +
      geom_point(
        data = int_df, aes(x = x, y = y),
        shape = 21, size = 4.5, fill = "#fde68a", color = "#d97706", stroke = 1.5
      ) +
      geom_text(
        data = int_df, aes(x = x, y = y + 0.48, label = num),
        color = "#92400e", size = 3.8, fontface = "bold"
      )
  }

  # Result label at bottom
  p <- p +
    annotate(
      "label",
      x = 3, y = 0.38,
      label      = sc$desc,
      color      = lbl_col,
      fill       = lbl_fill,
      label.size = 0.3,
      size       = 4,
      fontface   = "bold"
    ) +
    coord_equal(xlim = c(XMIN, XMAX), ylim = c(YMIN, YMAX)) +
    theme_void() +
    theme(
      plot.background = element_rect(fill = "transparent", color = NA),
      plot.margin     = margin(6, 6, 6, 6)
    )

  fname <- sprintf("public/point-in-polygon-ray-%d.png", sc$idx)
  ggsave(fname, p, width = 4, height = 4, dpi = 300, bg = "transparent")
  message("Written: ", fname)
}

message("All done.")
