import L from "leaflet";
import Map from "leaflet";
// import "leaflet/dist/leaflet.css";
// 11:07 $ gleam run -m lustre/dev start
//    Compiled in 0.06s
//     Running lustre/dev.main
// ✅ Project compiled successfully
// ✅ Esbuild already installed!
// ❌ Bundling with esbuild

// I ran into an unexpected issue while trying to bundle your project with esbuild.
// Here's the error message I got:

//     ✘ [ERROR] No loader is configured for ".png" files: node_modules/leaflet/dist/images/marker-icon.png

//     node_modules/leaflet/dist/leaflet.css:407:19:
//       407 │   background-image: url(images/marker-icon.png);
//           ╵                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~

// ✘ [ERROR] No loader is configured for ".png" files: node_modules/leaflet/dist/images/layers.png

//     node_modules/leaflet/dist/leaflet.css:359:19:
//       359 │   background-image: url(images/layers.png);
//           ╵                     ~~~~~~~~~~~~~~~~~~~~~~

// ✘ [ERROR] No loader is configured for ".png" files: node_modules/leaflet/dist/images/layers-2x.png

//     node_modules/leaflet/dist/leaflet.css:364:19:
//       364 │   background-image: url(images/layers-2x.png);
//           ╵                     ~~~~~~~~~~~~~~~~~~~~~~~~~

// 3 errors

// If you think this is a bug, please open an issue at
// https://github.com/lustre-labs/dev-tools/issues/new with some details about what
// you were trying to do when you ran into this issue.

export function new_map(container: string): Map {
  var map = L.map("map").setView([51.505, -0.09], 13);
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution:
      '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
  }).addTo(map);
  return map;
}
