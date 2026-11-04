library(sf)
library(ggplot2)
library(dplyr)
library(rnaturalearth)
library(rnaturalearthdata)


# ============================================================
# Task 1: Bat monitoring grid
#
# You need to place acoustic bat detectors across Switzerland
# on a regular 2 km grid, each covering a 1 km radius.
#
# Why does this require a projected CRS?
# "2 km apart" is a distance in metres — but WGS84 coordinates
# are in degrees. 1° latitude ≈ 111 km everywhere, but
# 1° longitude shrinks toward the poles. So degree-based
# spacing is not equal-distance spacing on the ground.
# ============================================================

ch <- ne_countries(
  country = "Switzerland",
  scale = 10,
  returnclass = "sf"
)

# Demonstrate the problem: how far is 0.018° in each direction at 47°N?
p0 <- st_sfc(st_point(c(7.000, 47.000)), crs = 4326)
p_east <- st_sfc(st_point(c(7.018, 47.000)), crs = 4326) # 0.018° east
p_north <- st_sfc(st_point(c(7.000, 47.018)), crs = 4326) # 0.018° north

cat("0.018° east  at 47°N:", round(st_distance(p0, p_east)), "m (want 2000)\n")
cat("0.018° north at 47°N:", round(st_distance(p0, p_north)), "m (want 2000)\n")
# → east-west spacing is ~1375 m, north-south is ~2002 m
# A degree-based grid is NOT equally spaced on the ground

# --- Correct workflow: project → grid → buffer ---
ch_lv95 <- st_transform(ch, 2056)

grid_pts <- st_make_grid(ch_lv95, cellsize = 20000, what = "centers") |>
  st_as_sf()

# Keep only points inside Switzerland
grid_ch <- grid_pts[ch_lv95, , ]

# 1 km radius circles
circles <- st_buffer(grid_ch, dist = 7000)


library(tmap)

tm_shape(ch_lv95, crs = 2056) +
  tm_polygons() +
  tm_shape(circles) +
  tm_polygons() +
  tm_graticules()

tm_shape(ch_lv95, crs = 4326) +
  tm_polygons() +
  tm_shape(circles) +
  tm_polygons() +
  tm_title("EPSG 4326") +
  tm_graticules(crs = 4326)

tm_shape(ch_lv95, crs = 3857) +
  tm_polygons() +
  tm_shape(circles) +
  tm_polygons() +
  tm_title("EPSG 3857") +
  tm_graticules(crs = 3857)

tm_shape(ch_lv95, crs = "+proj=eqc") +
  tm_polygons() +
  tm_shape(circles) +
  tm_polygons() +
  tm_title("+proj=eqc") +
  tm_graticules(crs = "+proj=eqc")

tm_shape(ch_lv95, crs = "+proj=eqc +lat_ts=47") +
  tm_polygons() +
  tm_shape(circles) +
  tm_polygons() +
  tm_title("+proj=eqc +lat_ts=47") +
  tm_graticules(crs = "+proj=eqc +lat_ts=47")


# ============================================================
# Task 2: Bat monitoring grid *in Germany*
#
# ============================================================

de <- ne_countries(
  country = "Germany",
  scale = 10,
  returnclass = "sf"
)

# --- Correct workflow: project → grid → buffer ---
de_25832 <- st_transform(de, 25832)

grid_pts_de <- st_make_grid(de_25832, cellsize = 20000, what = "centers") |>
  st_as_sf()

# Keep only points inside Germany
grid_de <- grid_pts_de[de_25832, , ]

# 1 km radius circles
circles_de <- st_buffer(grid_de, dist = 10000)


library(tmap)

tm_shape(de_25832, crs = 2056) +
  tm_polygons()

tm_shape(de_25832, crs = 2056) +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("EPSG 2056") +
  tm_graticules()


tm_shape(de_25832, crs = 25832) +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("EPSG 25832") +
  tm_graticules()

tm_shape(de_25832, crs = 4326) +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("EPSG 4326") +
  tm_graticules(crs = 4326)

tm_shape(de_25832, crs = 3857) +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("EPSG 3857") +
  tm_graticules(crs = 3857)

tm_shape(de_25832, crs = "+proj=eqc") +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("+proj=eqc") +
  tm_graticules(crs = "+proj=eqc")

tm_shape(de_25832, crs = "+proj=eqc +lat_ts=51") +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("+proj=eqc +lat_ts=51") +
  tm_graticules(crs = "+proj=eqc +lat_ts=51")

tm_shape(de_25832, crs = 3035) +
  tm_polygons() +
  tm_shape(circles_de) +
  tm_polygons() +
  tm_title("EPSG 3035 (ETRS89-LAEA)") +
  tm_graticules(crs = 3035)


# ============================================================
# Task 3: Tissot's Indicatrix
#
# Create circles of equal real-world size across the globe.
# Display them in four projections.
# Circles that look equal in size → equal-area projection.
# Circles that grow, shrink, or distort → not equal-area.
# ============================================================

world <- ne_countries(returnclass = "sf")

st_write(world, "tasks.gpkg", "world")

plot(world, max.plot = 1)

tm_shape(world, crs = 2056) + tm_polygons()

# Seed points on a regular grid
seeds <- expand.grid(lon = seq(-160, 160, 20), lat = seq(-70, 70, 20)) |>
  st_as_sf(coords = c("lon", "lat"), crs = 4326)

# Buffer in an equal-area projection: all circles have the same real-world radius
circles_laea <- seeds |>
  st_transform("+proj=laea +lat_0=0 +lon_0=0") |>
  st_buffer(dist = 500000) # 500 km


# make maps using tmap

# ============================================================
# Task 4: Red kite migration
#
# Red kites (Milvus milvus) breeding in Switzerland migrate
# south-west in autumn, wintering in Spain and North Africa.
#
# The same route looks different depending on the projection.
# Which projection gives you the clearest picture of the journey?
# ============================================================

kite_coords <- rbind(
  c(8.54, 47.37), # Zürich (breeding)
  c(6.86, 45.92), # Western Alps crossing
  c(5.37, 43.30), # Camargue / Rhône delta
  c(1.44, 40.42), # Eastern Spain
  c(-3.70, 37.18), # Southern Spain (Andalusia)
  c(-5.35, 36.14), # Strait of Gibraltar
  c(-5.80, 35.78), # Northern Morocco coast
  c(-6.83, 33.99) # Rabat region (wintering)
)

route <- st_linestring(kite_coords) |>
  st_sfc(crs = 4326) |>
  st_segmentize(dfMaxLength = 0.1) # densify so curves render correctly after reprojection

breeding <- st_sfc(st_point(kite_coords[1, ]), crs = 4326)
wintering <- st_sfc(st_point(kite_coords[nrow(kite_coords), ]), crs = 4326)

europe_africa <- ne_countries(returnclass = "sf") |>
  filter(continent %in% c("Europe", "Africa"))

# make maps using tmap
