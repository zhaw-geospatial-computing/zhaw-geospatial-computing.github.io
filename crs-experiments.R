library(sf)
library(ggplot2)
library(dplyr)
library(tidyr)
library(tibble)
library(rnaturalearth)
library(rnaturalearthdata)


# Oblate spheroid ---------------------------------------------------------
# The Earth is not a sphere — it is slightly flattened at the poles.
# Equatorial radius a > polar radius b; flattening f = (a-b)/a ≈ 1/298.
# The actual difference is ~21 km on a radius of ~6378 km, so it is nearly
# invisible at true scale. We exaggerate the flattening for visual clarity.

a <- 6378.137 # equatorial radius (km)
b <- 6356.752 # polar radius (km)
f <- (a - b) / a # actual flattening ≈ 1/298.257

exag <- 15
b_vis <- a * (1 - exag * f) # exaggerated polar radius for plotting
theta <- seq(0, 2 * pi, length.out = 1000)

p <- bind_rows(
  tibble(x = a * cos(theta), y = a * sin(theta), shape = "Sphere"),
  tibble(
    x = a * cos(theta),
    y = b_vis * sin(theta),
    shape = "Oblate spheroid"
  )
) |>
  ggplot(aes(x, y, colour = shape, linetype = shape)) +
  geom_path(linewidth = 0.8) +
  scale_colour_manual(
    values = c("Sphere" = "grey70", "Oblate spheroid" = "steelblue")
  ) +
  scale_linetype_manual(
    values = c("Sphere" = "dashed", "Oblate spheroid" = "solid")
  ) +
  annotate(
    "segment",
    x = 0,
    xend = a,
    y = 0,
    yend = 0,
    colour = "grey40",
    linewidth = 0.4,
    arrow = arrow(ends = "both", length = unit(0.08, "cm"), type = "closed")
  ) +
  annotate(
    "text",
    x = a / 2,
    y = -350,
    label = paste0("a = ", round(a), " km  (equatorial)"),
    size = 3,
    colour = "grey40"
  ) +
  annotate(
    "segment",
    x = 0,
    xend = 0,
    y = 0,
    yend = b_vis,
    colour = "grey40",
    linewidth = 0.4,
    arrow = arrow(ends = "both", length = unit(0.08, "cm"), type = "closed")
  ) +
  annotate(
    "text",
    x = -550,
    y = b_vis / 2,
    label = paste0("b = ", round(b), " km  (polar)"),
    size = 3,
    colour = "grey40",
    angle = 90
  ) +
  labs(
    colour = NULL,
    linetype = NULL,
    caption = paste0(
      "Flattening exaggerated ",
      exag,
      "\u00d7 for visibility  |  actual f \u2248 1/298"
    )
  ) +
  coord_equal() +
  theme_void() +
  theme(
    legend.position = "bottom",
    plot.caption = element_text(colour = "grey60", size = 8, hjust = 0.5),
    plot.margin = margin(30, 30, 10, 30)
  )


ggsave(
  "public/Introduction/oblate-spheroid.png",
  p,
  width = 6,
  height = 6,
  dpi = 150,
  bg = "white"
)


# Datum positioning --------------------------------------------------------
# A datum positions the ellipsoid in 3D space relative to the real Earth.
# Geocentric datums (WGS84): origin at Earth's centre of mass — global fit.
# Local datums (CH1903 / Bessel 1841): origin offset to best fit a region.
# Same physical point → different position vector → different coordinates.
# The offset is exaggerated here (actual ~0.8 km on a 6378 km globe).

theta <- seq(0, 2 * pi, length.out = 1000)
R     <- 1

cx <- 0.13   # exaggerated x-offset of local datum origin
cy <- 0.08   # exaggerated y-offset of local datum origin

earth_pts <- tibble(x = R * cos(theta), y = R * sin(theta))

# Surface point (defined by its geocentric angle)
angle_geo   <- 40 * pi / 180
px          <- R * cos(angle_geo)
py          <- R * sin(angle_geo)
angle_local <- atan2(py - cy, px - cx)

# Small arcs showing the angle measured from each origin
arc_r     <- 0.32
arc_geo   <- tibble(
  x = arc_r * cos(seq(0, angle_geo,   length.out = 100)),
  y = arc_r * sin(seq(0, angle_geo,   length.out = 100))
)
arc_local <- tibble(
  x = cx + arc_r * cos(seq(0, angle_local, length.out = 100)),
  y = cy + arc_r * sin(seq(0, angle_local, length.out = 100))
)

# Endpoint slightly inside the surface point for arrowhead clearance
tip_scale  <- 0.96
local_len  <- sqrt((px - cx)^2 + (py - cy)^2)
local_tip  <- tibble(
  x = px - (1 - tip_scale) * (px - cx) / local_len,
  y = py - (1 - tip_scale) * (py - cy) / local_len
)

datum_plot <- ggplot() +
  geom_polygon(data = earth_pts, aes(x, y), fill = "#e8f4f8", colour = NA) +
  geom_path(data = earth_pts,    aes(x, y), colour = "grey55", linewidth = 0.5) +
  # Angle arcs
  geom_path(data = arc_geo,   aes(x, y), colour = "steelblue", linewidth = 0.5, linetype = "dotted") +
  geom_path(data = arc_local, aes(x, y), colour = "coral",     linewidth = 0.5, linetype = "dotted") +
  # Vectors from each origin to the surface point
  annotate("segment",
           x = 0, y = 0, xend = px * tip_scale, yend = py * tip_scale,
           colour = "steelblue", linewidth = 0.8,
           arrow = arrow(length = unit(0.18, "cm"), type = "closed")) +
  annotate("segment",
           x = cx, y = cy, xend = local_tip$x, yend = local_tip$y,
           colour = "coral", linewidth = 0.8, linetype = "dashed",
           arrow = arrow(length = unit(0.18, "cm"), type = "closed")) +
  # Origins
  annotate("point", x = 0,  y = 0,  size = 3.5, colour = "steelblue") +
  annotate("point", x = cx, y = cy, size = 3.5, colour = "coral") +
  # Surface point
  annotate("point", x = px, y = py, size = 4, colour = "black") +
  # Labels
  annotate("label", x = -0.06, y = -0.07,
           label = "WGS84\n(geocentric)", size = 2.8,
           colour = "steelblue", fill = "white", hjust = 1) +
  annotate("label", x = cx + 0.05, y = cy - 0.08,
           label = "CH1903\n(local datum)", size = 2.8,
           colour = "coral", fill = "white", hjust = 0) +
  annotate("label", x = px + 0.05, y = py,
           label = "Same physical point\ndifferent coordinates", size = 2.5,
           fill = "white", hjust = 0) +
  labs(caption = "Datum offset exaggerated — actual ~0.8 km on a 6378 km globe") +
  coord_equal(xlim = c(-1.35, 1.55), ylim = c(-1.25, 1.25)) +
  theme_void() +
  theme(
    plot.caption = element_text(size = 7.5, colour = "grey60", hjust = 0.5),
    plot.margin  = margin(15, 15, 10, 15)
  )

ggsave(
  "public/Introduction/datum-positioning.png",
  datum_plot,
  width = 6,
  height = 5,
  dpi = 150,
  bg = "white"
)


# Part 1: Degrees to Metres -----------------------------------------------

# Geographic coordinates (lat/lon) are in degrees, not metres.
# 1° of latitude is always ≈ 111 km.
# 1° of longitude shrinks toward the poles:
#
#   km per 1° longitude = 40075 * cos(latitude) / 360

km_per_deg_lon <- function(lat_deg) {
  40075 * cos(lat_deg * pi / 180) / 360
}

km_per_deg_lon(c(0, 45, 47, 80, 90))


# Arc-seconds to decimal degrees:
#   decimal_deg = degrees + minutes/60 + seconds/3600
#
# Common raster resolutions:
#   30 arcsec  = 0.00833°  → cell height ~0.93 km, width at 47°N ~0.63 km
#   10 arcmin  = 0.16667°  → cell height ~18.5 km, width at 47°N ~12.7 km
#   1 degree   = 1°        → cell height ~111 km,  width at 47°N ~76 km

# Haversine distance -------------------------------------------------------
# Great-circle distance between two points (in metres).
# Defaults: distance of 1° east at the given latitude (east-west width of a 1° cell).

haversine_distance <- function(
  lon1,
  lat1,
  lon2 = lon1 + 1, # default: 1° east
  lat2 = lat1 # default: same latitude
) {
  R <- 6378.137 # Earth radius in km
  dlat <- (lat2 - lat1) * pi / 180
  dlon <- (lon2 - lon1) * pi / 180
  a <- sin(dlat / 2)^2 +
    cos(lat1 * pi / 180) * cos(lat2 * pi / 180) * sin(dlon / 2)^2
  2 * atan2(sqrt(a), sqrt(1 - a)) * R * 1000 # metres
}

# Width of a 10-arcminute raster cell at 47°N (Zurich):
haversine_distance(0, 47) * (10 / 60)


# Experiment 1: Real-world size of a 1° cell ------------------------------
# East-west width varies strongly with latitude; north-south height is near-constant.

expand.grid(lat = seq(-90, 90, 1), lon = seq(-180, 180, 1)) |>
  mutate(
    `East-West\n(varies with latitude)` = haversine_distance(
      lon,
      lat,
      lon + 1,
      lat
    ),
    `North-South\n(near constant)` = haversine_distance(lon, lat, lon, lat + 1)
  ) |>
  pivot_longer(
    c(starts_with("East"), starts_with("North")),
    names_to = "direction",
    values_to = "metres"
  ) |>
  ggplot(aes(lon, lat, fill = metres / 1000)) +
  geom_raster() +
  scale_fill_viridis_c(name = "km per 1°") +
  facet_wrap(~direction) +
  labs(
    title = "Real-world size of a 1° cell",
    x = "Longitude",
    y = "Latitude"
  ) +
  coord_equal() +
  theme_minimal()


# Experiment 2: Raster resolution in context -------------------------------
# How wide is a raster cell (in km) at each latitude for three common resolutions?

tribble(
  ~resolution            , ~deg      ,
  "1°"                   ,         1 ,
  "10 arcmin (0.1667°)"  , 10 / 60   ,
  "30 arcsec (0.00833°)" , 30 / 3600
) |>
  mutate(resolution = factor(resolution, levels = resolution)) |>
  crossing(lat = seq(-90, 90, 1)) |>
  mutate(km = haversine_distance(0, lat) * deg / 1000) |>
  ggplot(aes(km, lat)) +
  geom_path() +
  facet_wrap(~resolution, scales = "free_x") +
  labs(
    title = "East-west cell width by latitude for common raster resolutions",
    x = "Cell width (km)",
    y = "Latitude"
  ) +
  theme_minimal()


# Part 2: Projection Distortion -------------------------------------------
# All projections distort the Earth. The question is *what* they distort:
#   Conformal  (e.g. Mercator):  preserves local angles/shape — distorts area
#   Equal-area (e.g. Mollweide): preserves area — distorts shape
#   Equidistant:                 preserves distances from a reference point
#
# Plate carrée (equirectangular): what you get when degrees are treated as x/y pixels.
# This is what EPSG:4326 looks like when rendered naively on screen.

# Setup: equal-area circles ------------------------------------------------
# 500 km circles at a regular grid. Same real-world size everywhere —
# any visual difference between projections is pure distortion.
# sf uses S2 for geographic CRS, so st_buffer() gives correct geodesic circles.

world <- ne_countries(returnclass = "sf")

grid_pts <- expand.grid(lon = seq(-180, 180, 20), lat = seq(-90, 90, 20)) |>
  st_as_sf(coords = c("lon", "lat"), crs = 4326, remove = FALSE)

circles <- st_buffer(grid_pts, dist = 500e3) |>
  filter(abs(lon) != 180) # remove circles at ±180° to avoid date-line artefacts

base_map <- ggplot() +
  geom_sf(data = world, fill = "grey75", colour = "grey90", linewidth = 0.2) +
  geom_sf(data = circles, fill = "steelblue", alpha = 0.4, colour = NA) +
  theme_minimal() +
  theme(panel.grid = element_line(colour = "grey85", linetype = 2))


# Plate carrée — the implicit default --------------------------------------
base_map +
  labs(title = "Plate carrée (equirectangular) — degrees treated as x/y")

# Mollweide — equal-area ---------------------------------------------------
base_map +
  coord_sf(crs = "+proj=moll") +
  labs(title = "Mollweide — equal-area global projection")

# LAEA Europe (EPSG:3035) --------------------------------------------------
base_map +
  coord_sf(crs = st_crs(3035)) +
  labs(title = "Lambert Azimuthal Equal-Area — EPSG:3035 (Eurostat)")

# Orthographic — the globe from space --------------------------------------
base_map +
  coord_sf(
    crs = "+proj=ortho +lat_0=45 +lon_0=10 +a=6371000 +b=6371000 +units=m +no_defs"
  ) +
  labs(title = "Orthographic — as seen from space (centred on Europe)")
