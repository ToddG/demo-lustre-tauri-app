import { Map } from "maplibre-gl";

export function new_map(container: string): Map {
  return new Map({
    container: container,
    style: "https://demotiles.maplibre.org/style.json", // stylesheet location
    center: [-74.5, 40], // starting position [lng, lat]
    zoom: 9, // starting zoom
  });
}
