library(ggplot2)

set.seed(42)

# ── Helpers ───────────────────────────────────────────────────────────────────

make_circle <- function(r, n = 300) {
  theta <- seq(0, 2 * pi, length.out = n + 1)[seq_len(n)]
  data.frame(x = r * cos(theta), y = r * sin(theta))
}

# ── Panel grid ────────────────────────────────────────────────────────────────

prec_levels <- c("Low", "High")
acc_levels  <- c("High", "Low")  # reversed so "High" row appears on top

panels <- expand.grid(
  precision = factor(prec_levels, levels = prec_levels),
  accuracy  = factor(acc_levels,  levels = acc_levels),
  stringsAsFactors = FALSE
)
panels$precision <- factor(panels$precision, levels = prec_levels)
panels$accuracy  <- factor(panels$accuracy,  levels = acc_levels)

# ── Dartboard ring polygons ───────────────────────────────────────────────────
# Draw from outer to inner; inner rings paint over outer ones.

ring_specs <- data.frame(
  r    = c(1.00,      0.75,      0.50,      0.25),
  fill = c("#CCCCCC", "#CC3333", "#EEEEEE", "#CC3333"),
  stringsAsFactors = FALSE
)

ring_data <- do.call(rbind, lapply(seq_len(nrow(ring_specs)), function(ri) {
  circ <- make_circle(ring_specs$r[ri])
  do.call(rbind, lapply(seq_len(nrow(panels)), function(pi) {
    data.frame(
      x          = circ$x,
      y          = circ$y,
      precision  = panels$precision[pi],
      accuracy   = panels$accuracy[pi],
      ring_id    = ri,
      fill_color = ring_specs$fill[ri],
      stringsAsFactors = FALSE
    )
  }))
}))

ring_data$precision <- factor(ring_data$precision, levels = prec_levels)
ring_data$accuracy  <- factor(ring_data$accuracy,  levels = acc_levels)

# ── Dart positions ────────────────────────────────────────────────────────────
# Low accuracy  → cluster centred off-bullseye  (~r 0.60)
# High accuracy → cluster centred on bullseye   (~r 0.00)
# Low precision → spread = 0.40 (very scattered, some miss board)
# High precision→ spread = 0.07 (tight)
# No clipping — shots that miss the board land outside the rings.

dart_params <- data.frame(
  precision = factor(c("Low",  "High", "Low",  "High"), levels = prec_levels),
  accuracy  = factor(c("Low",  "Low",  "High", "High"), levels = acc_levels),
  cx     = c( 0.42,  0.47,  0.00,  0.00),
  cy     = c( 0.38,  0.40,  0.00,  0.00),
  spread = c( 0.40,  0.07,  0.40,  0.07),
  stringsAsFactors = FALSE
)

darts <- do.call(rbind, lapply(seq_len(nrow(dart_params)), function(i) {
  p  <- dart_params[i, ]
  n  <- 6
  x_ <- rnorm(n, p$cx, p$spread)
  y_ <- rnorm(n, p$cy, p$spread)
  data.frame(x = x_, y = y_,
             precision = p$precision,
             accuracy  = p$accuracy,
             stringsAsFactors = FALSE)
}))

darts$precision <- factor(darts$precision, levels = prec_levels)
darts$accuracy  <- factor(darts$accuracy,  levels = acc_levels)

# Centre crosshair: one point per panel
centre_data <- panels

# ── Plot ──────────────────────────────────────────────────────────────────────

p <- ggplot() +
  # Dartboard rings (outer → inner)
  geom_polygon(
    data = ring_data,
    aes(x = x, y = y,
        group      = interaction(ring_id, precision, accuracy),
        fill       = fill_color),
    color = "gray40", linewidth = 0.25
  ) +
  scale_fill_identity() +
  # Centre crosshair
  geom_point(
    data = centre_data,
    aes(x = 0, y = 0),
    shape = 3, size = 2.5, color = "white", stroke = 1.4
  ) +
  # Bullet holes
  geom_point(
    data = darts,
    aes(x = x, y = y),
    shape = 21, size = 4,
    fill = "#111111", color = "white", stroke = 0.9
  ) +
  facet_grid(
    rows   = vars(accuracy),
    cols   = vars(precision),
    switch = "both"
  ) +
  coord_fixed(xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5), clip = "on") +
  labs(
    x = "Precision\nhow specific, how much variability",
    y = "Accuracy\ncorrelation with reality"
  ) +
  theme_minimal(base_size = 15) +
  theme(
    panel.grid        = element_blank(),
    panel.background  = element_rect(fill = "white", color = NA),
    plot.background   = element_rect(fill = "white", color = NA),
    axis.text         = element_blank(),
    axis.ticks        = element_blank(),
    strip.text.x      = element_text(size = 14, face = "bold",
                                     margin = margin(t = 8, b = 8)),
    strip.text.y      = element_text(size = 14, face = "bold",
                                     margin = margin(l = 8, r = 8)),
    strip.placement   = "outside",
    axis.title.x      = element_text(size = 13, lineheight = 1.3,
                                     margin = margin(t = 14)),
    axis.title.y      = element_text(size = 13, lineheight = 1.3,
                                     margin = margin(r = 14)),
    panel.spacing     = unit(2.5, "lines"),
    plot.margin       = margin(t = 12, r = 16, b = 12, l = 16)
  )

out_path <- file.path("public", "precision-accuracy-dartboard.png")
ggsave(out_path, p, width = 8, height = 8, dpi = 150, bg = "white")
message("Saved to ", out_path)
