# complexity-graph.R
# Plots O(n²) vs O(n log₂ n) for the Algorithmic Complexity slide.
# Run from project root (Modul-Geospatial-Computing/):
#   Rscript complexity-graph.R

library(ggplot2)

n <- seq(1, 30, length.out = 500)

df <- rbind(
  data.frame(n = n, y = n^2,              label = "O(n²)"),
  data.frame(n = n, y = n * log2(n),      label = "O(n log₂ n)")
)

p <- ggplot(df, aes(x = n, y = y, color = label)) +
  geom_line(linewidth = 1.2) +
  geom_vline(xintercept = 8, linetype = "dashed", color = "#9ca3af", linewidth = 0.6) +
  annotate("text", x = 8.5, y = 800, label = "n = 8", color = "#9ca3af", size = 3, hjust = 0) +
  scale_color_manual(
    values = c("O(n²)" = "#f59e0b", "O(n log₂ n)" = "#3b82f6"),
    name   = NULL
  ) +
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30)) +
  scale_y_continuous(breaks = c(0, 200, 400, 600, 800), limits = c(0, 900)) +
  labs(x = "n", y = "comparisons") +
  theme_minimal(base_size = 13) +
  theme(
    legend.position      = c(0.18, 0.88),
    legend.background    = element_rect(fill = "transparent", color = NA),
    legend.key           = element_rect(fill = "transparent", color = NA),
    panel.grid.minor     = element_blank(),
    plot.background      = element_rect(fill = "transparent", color = NA),
    panel.background     = element_rect(fill = "transparent", color = NA)
  )

ggsave(
  "public/complexity-graph.png",
  p,
  width  = 5,
  height = 3.2,
  dpi    = 300,
  bg     = "transparent"
)

message("Done. Image written to: public/complexity-graph.png")
