library(ggplot2)

# ── Shared geometry & save settings ───────────────────────────────────────────
# All images use identical coord limits and pixel dimensions so the circle
# overlaps perfectly when slides are shown in sequence.

theta  <- seq(0, 2 * pi, length.out = 300)
circle <- data.frame(x = cos(theta), y = sin(theta))

square <- data.frame(
  x = c(-1,  1, 1, -1, -1),
  y = c(-1, -1, 1,  1, -1)
)

LIM  <- c(-1.6, 1.6)   # same for all images
W    <- 4              # inches
H    <- 4
DPI  <- 150

save_plot <- function(p, name) {
  path <- file.path("public", paste0(name, ".png"))
  ggsave(path, p, width = W, height = H, dpi = DPI, bg = "white")
  message("Saved: ", path)
}

base_theme <- list(
  coord_fixed(xlim = LIM, ylim = LIM, expand = FALSE, clip = "on"),
  theme_void(),
  theme(
    plot.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(0, 0, 0, 0)
  )
)

# ── 1. Circle with radius annotation ──────────────────────────────────────────

p1 <- ggplot() +
  geom_polygon(data = circle, aes(x, y),
    fill = "#dbeafe", color = "#2563eb", linewidth = 1.2) +
  annotate("segment", x = 0, y = 0, xend = 1, yend = 0,
    color = "#dc2626", linewidth = 1.0,
    arrow = arrow(ends = "both", type = "open", length = unit(0.07, "inches"))) +
  annotate("point", x = 0, y = 0, size = 2.5, color = "#1e293b") +
  annotate("text", x = 0.5, y = 0.12, label = "1 m",
    color = "#dc2626", size = 5.5, fontface = "bold") +
  base_theme

save_plot(p1, "mc-pi-circle-1")

# ── 2. Circle inscribed in 2×2 square ─────────────────────────────────────────

p2 <- ggplot() +
  geom_polygon(data = square, aes(x, y),
    fill = "#fef9c3", color = "#ca8a04", linewidth = 1.2) +
  geom_polygon(data = circle, aes(x, y),
    fill = "#dbeafe", color = "#2563eb", linewidth = 1.2) +
  annotate("segment", x = 0, y = 0, xend = 1, yend = 0,
    color = "#dc2626", linewidth = 1.0,
    arrow = arrow(ends = "both", type = "open", length = unit(0.07, "inches"))) +
  annotate("point", x = 0, y = 0, size = 2.5, color = "#1e293b") +
  annotate("text", x = 0.5, y = 0.12, label = "1 m",
    color = "#dc2626", size = 5, fontface = "bold") +
  annotate("segment", x = -1, y = -1.25, xend = 1, yend = -1.25,
    color = "#ca8a04", linewidth = 0.9,
    arrow = arrow(ends = "both", type = "open", length = unit(0.07, "inches"))) +
  annotate("text", x = 0, y = -1.42, label = "2 m",
    color = "#ca8a04", size = 5, fontface = "bold") +
  base_theme

save_plot(p2, "mc-pi-circle-2")

# ── 3. Random points coloured by inside/outside ───────────────────────────────

set.seed(42)
N   <- 1000
pts <- data.frame(x = runif(N, -1, 1), y = runif(N, -1, 1))
pts$inside <- pts$x^2 + pts$y^2 <= 1

p3 <- ggplot() +
  geom_polygon(data = square, aes(x, y),
    fill = "#fef9c3", color = "#ca8a04", linewidth = 1.2) +
  geom_polygon(data = circle, aes(x, y),
    fill = NA, color = "#2563eb", linewidth = 1.2) +
  geom_point(data = pts, aes(x, y, color = inside),
    size = 0.8, alpha = 0.7) +
  scale_color_manual(values = c("TRUE" = "#2563eb", "FALSE" = "#ca8a04"),
    guide = "none") +
  base_theme

save_plot(p3, "mc-pi-circle-3")

# ── 4. Circle + square with coordinate labels ─────────────────────────────────

col_coord <- "gray30"

p4 <- ggplot() +
  geom_polygon(data = square, aes(x, y),
    fill = "#fef9c3", color = "#ca8a04", linewidth = 1.2) +
  geom_polygon(data = circle, aes(x, y),
    fill = "#dbeafe", color = "#2563eb", linewidth = 1.2) +
  # x-axis: tick segments + labels below the square
  annotate("segment", x = c(-1, 0, 1), xend = c(-1, 0, 1),
    y = -1, yend = -1.1, color = col_coord, linewidth = 0.8) +
  annotate("text", x = c(-1, 0, 1), y = -1.25,
    label = c("-1", "0", "1"), color = col_coord, size = 5, fontface = "bold") +
  # y-axis: tick segments + labels left of the square
  annotate("segment", x = -1, xend = -1.1,
    y = c(-1, 0, 1), yend = c(-1, 0, 1), color = col_coord, linewidth = 0.8) +
  annotate("text", x = -1.25, y = c(-1, 0, 1),
    label = c("-1", "0", "1"), color = col_coord, size = 5, fontface = "bold") +
  base_theme

save_plot(p4, "mc-pi-circle-4")
