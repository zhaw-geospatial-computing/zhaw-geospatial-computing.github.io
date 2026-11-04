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
# Same ellipsoid shape, two different placements:
#   Blue (solid)   = geocentric datum (WGS84): centred at Earth's centre of mass
#   Coral (dashed) = local datum (CH1903): origin offset to best fit a region

R_e <- 1.00 # normalised "real Earth" radius
a_e <- 0.86 # ellipsoid equatorial radius (normalised)
b_e <- 0.82 # ellipsoid polar radius (normalised, slightly flattened)

ox <- 0.09 # local datum x-offset (exaggerated)
oy <- 0.05 # local datum y-offset (exaggerated)

theta <- seq(0, 2 * pi, length.out = 500)

earth_outline <- tibble(x = R_e * cos(theta), y = R_e * sin(theta))
ell_geo <- tibble(x = a_e * cos(theta), y = b_e * sin(theta))
ell_local <- tibble(x = ox + a_e * cos(theta), y = oy + b_e * sin(theta))

datum_plot <- ggplot() +
  geom_polygon(
    data = earth_outline,
    aes(x, y),
    fill = "#e8f4f8",
    colour = "grey55",
    linewidth = 0.5
  ) +
  geom_path(data = ell_geo, aes(x, y), colour = "steelblue", linewidth = 0.9) +
  geom_path(
    data = ell_local,
    aes(x, y),
    colour = "coral",
    linewidth = 0.9,
    linetype = "dashed"
  ) +
  # Origins
  annotate("point", x = 0, y = 0, size = 3.5, colour = "steelblue") +
  annotate("point", x = ox, y = oy, size = 3.5, colour = "coral") +
  # Offset arrow between origins
  annotate(
    "segment",
    x = 0,
    xend = ox * 0.8,
    y = 0,
    yend = oy * 0.8,
    colour = "grey40",
    linewidth = 0.4,
    arrow = arrow(length = unit(0.12, "cm"), type = "closed")
  ) +
  # Labels
  annotate(
    "label",
    x = -0.07,
    y = -0.10,
    label = "Geocentric\n(e.g. WGS84)",
    size = 2.8,
    colour = "steelblue",
    fill = "white",
    label.size = 0,
    hjust = 1,
    lineheight = 1.2
  ) +
  annotate(
    "label",
    x = ox + 0.07,
    y = oy + 0.10,
    label = "Local datum\n(e.g. CH1903)",
    size = 2.8,
    colour = "coral",
    fill = "white",
    label.size = 0,
    hjust = 0,
    lineheight = 1.2
  ) +
  labs(
    caption = "Same ellipsoid shape, different placement  |  offset exaggerated for clarity"
  ) +
  coord_equal(xlim = c(-1.3, 1.3), ylim = c(-1.3, 1.3)) +
  theme_void() +
  theme(
    plot.caption = element_text(colour = "grey60", size = 8, hjust = 0.5),
    plot.margin = margin(30, 30, 10, 30)
  )

ggsave(
  "public/Introduction/datum-positioning.png",
  datum_plot,
  width = 6,
  height = 6,
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


# 1° longitude width in km by latitude ------------------------------------
# Saved as a slide figure to replace the table on the Degrees to Metres slide.

lon_by_lat <- tibble(lat = seq(-90, 90, 0.5)) |>
  mutate(km = cos(lat * pi / 180) * 40075 / 360)

refs <- tibble(
  lat = c(-33, 0, 47, 59.3, 64, 90),
  label = c(
    "33°S (Cape Town)",
    "0° (equator)",
    "47°N (Zürich)",
    "59°N (Stockholm)",
    "64°N (Reykjavík)",
    "90° (pole)"
  )
) |>
  mutate(
    km = cos(lat * pi / 180) * 40075 / 360,
    label = paste0(label, " — ", round(km), " km")
  )

lon_km_plot <- ggplot(lon_by_lat, aes(x = km, y = lat)) +
  geom_path(colour = "steelblue", linewidth = 0.9) +
  geom_segment(
    data = refs,
    aes(x = 0, xend = km, y = lat, yend = lat),
    colour = "grey75",
    linewidth = 0.35,
    linetype = "dotted"
  ) +
  geom_point(
    data = refs,
    aes(x = km, y = lat),
    colour = "steelblue",
    size = 2.5
  ) +
  geom_text(
    data = refs,
    aes(x = km + 3, y = lat, label = label),
    hjust = 0,
    size = 2.8,
    colour = "grey30"
  ) +
  scale_y_continuous(
    breaks = seq(-90, 90, 30),
    labels = \(x) {
      ifelse(x == 0, "0°", paste0(abs(x), "°", ifelse(x > 0, "N", "S")))
    }
  ) +
  scale_x_continuous(limits = c(0, 160)) +
  labs(
    x = "km per 1° longitude",
    y = NULL,
    caption = "Spherical approximation — 40 075 × cos(φ) / 360"
  ) +
  theme_minimal() +
  theme(
    panel.grid.minor = element_blank(),
    plot.caption = element_text(colour = "grey60", size = 7.5, hjust = 0.5)
  )

ggsave(
  "public/Introduction/lon-km-by-lat.png",
  lon_km_plot,
  width = 6,
  height = 7,
  dpi = 150,
  bg = "white"
)


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


# Plate carrée: world -------------------------------------------------------

base_map_no_circles <- ggplot() +
  geom_sf(data = world, fill = "grey75", colour = "grey90", linewidth = 0.2) +
  theme_minimal() +
  theme(panel.grid = element_line(colour = "grey85", linetype = 2))

ggsave(
  "public/Introduction/platecarre-world-circles.png",
  base_map,
  width = 10,
  height = 5.5,
  dpi = 150,
  bg = "white"
)

ggsave(
  "public/Introduction/platecarre-world.png",
  base_map_no_circles,
  width = 10,
  height = 5.5,
  dpi = 150,
  bg = "white"
)


# Plate carrée: Switzerland -------------------------------------------------
# At 47°N: 1° longitude ≈ 76 km, 1° latitude ≈ 111 km.
# Treating degrees as x/y stretches the shape east–west.

ch <- ne_countries(
  country = "Switzerland",
  scale = "medium",
  returnclass = "sf"
)
ch_cantons <- ne_states(country = "Switzerland", returnclass = "sf")

st_crs(ch_cantons) <- NA


int_lables <- \(x) {
  low <- ceiling(min(x))
  high <- floor(max(x))
  as.integer(seq(low, high, 1))
}

platecarre_ch <-
  ggplot() +
  geom_sf(
    data = ch_cantons,
    fill = "grey85",
    colour = "white",
    linewidth = 0.3
  ) +
  scale_x_continuous(breaks = int_lables) +
  scale_y_continuous(breaks = int_lables) +
  labs(x = "Longitude (°E)", y = "Latitude (°N)") +
  theme_minimal()

ggsave(
  "public/Introduction/platecarre-switzerland.png",
  platecarre_ch,
  width = 7,
  height = 5,
  dpi = 150,
  bg = "white"
)


# Experiment 3: Measuring in different CRS ---------------------------------
# The same geometry gives different (and sometimes wrong) results
# depending on which CRS is active and how arithmetic is done.

# --- 3a: Distance Zurich – Geneva ---

zurich_coords <- c(8.5417, 47.3769)
geneva_coords  <- c(6.1432, 46.2044)

# Naive: treat degree differences as if they were a distance
naive_dist <- sqrt(sum((zurich_coords - geneva_coords)^2))
cat("Naive degree arithmetic:       ", round(naive_dist, 3),
    "— no unit, meaningless\n")

zurich <- st_sfc(st_point(zurich_coords), crs = 4326)
geneva <- st_sfc(st_point(geneva_coords),  crs = 4326)

# sf uses ellipsoidal geometry on geographic CRS by default
cat("sf geographic CRS (ellipsoid): ", round(st_distance(zurich, geneva) / 1000, 1), "km\n")

# After projecting to LV95 — planar distance on projected CRS
zurich_lv95 <- st_transform(zurich, 2056)
geneva_lv95 <- st_transform(geneva, 2056)
cat("sf projected (LV95):           ", round(st_distance(zurich_lv95, geneva_lv95) / 1000, 1), "km\n")


# --- 3b: Area of Switzerland ---

switzerland <- ne_countries(country = "Switzerland", returnclass = "sf")

# Naive: bounding box extent in square degrees
bbox <- st_bbox(switzerland)
naive_area_deg2 <- (bbox["xmax"] - bbox["xmin"]) * (bbox["ymax"] - bbox["ymin"])
cat("\nNaive bbox (°²):                  ", round(naive_area_deg2, 2), "°² — meaningless\n")

# sf with s2 spherical geometry (default): correct even in geographic CRS
cat("sf geographic CRS (s2 on):        ",
    round(as.numeric(st_area(switzerland)) / 1e6), "km²\n")

# Disable s2: GEOS uses planar geometry on degrees → wrong answer
sf_use_s2(FALSE)
cat("sf geographic CRS (s2 off):       ",
    round(as.numeric(st_area(switzerland)) / 1e6), "km²\n")
sf_use_s2(TRUE)

# Project to LV95 first: planar geometry on a projected CRS is correct
switzerland_lv95 <- st_transform(switzerland, 2056)
cat("sf projected (LV95, EPSG:2056):   ",
    round(as.numeric(st_area(switzerland_lv95)) / 1e6), "km²\n")
cat("Known value:                      ~41 285 km²\n")


# Experiment 4: Choosing a projection for other regions --------------------
# For each region: pick an appropriate CRS and justify the choice.
# Key questions: what property must be preserved? what is the use case?

# --- Germany: national analysis ---
# UTM zone 32N (EPSG:25832) — conformal, metre-based, standard in German geodesy
germany <- ne_countries(country = "Germany", returnclass = "sf")

ggplot(st_transform(germany, 25832)) +
  geom_sf(fill = "grey85") +
  labs(
    title = "Germany — UTM zone 32N (EPSG:25832)",
    subtitle = "Conformal · metres · standard for German official data"
  ) +
  theme_minimal()

# --- Contiguous USA: thematic choropleth map ---
# Albers Equal-Area Conic (EPSG:5070) — preserves area, standard for US thematic maps
usa <- ne_countries(country = "United States of America", returnclass = "sf")

ggplot(st_transform(usa, 5070)) +
  geom_sf(fill = "grey85") +
  labs(
    title = "USA — Albers Equal-Area Conic (EPSG:5070)",
    subtitle = "Equal-area · correct relative sizes · standard for US thematic maps"
  ) +
  theme_minimal()

# --- World: global thematic map (e.g. deforestation, land cover) ---
# Equal Earth — equal-area pseudocylindrical, visually balanced
ggplot(st_transform(world, "+proj=eqearth")) +
  geom_sf(fill = "grey85", colour = "white", linewidth = 0.2) +
  labs(
    title = "World — Equal Earth projection",
    subtitle = "Equal-area pseudocylindrical · preserves relative country sizes"
  ) +
  theme_minimal()
