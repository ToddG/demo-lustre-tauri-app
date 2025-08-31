import maplibregl from "maplibre-gl";
import "maplibre-gl/dist/maplibre-gl.css";

export function new_map(container: string): maplibregl.Map {
  let map = new maplibregl.Map({
    container: container,
    style: "https://demotiles.maplibre.org/style.json", // stylesheet location
    center: [-74.5, 40], // starting position [lng, lat]
    zoom: 9, // starting zoom
  });
  return map;
}
