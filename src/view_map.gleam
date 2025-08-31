import lustre/attribute
import lustre/element
import lustre/element/html
import lustre/element/keyed

pub fn map(maplibre_visibility: String, leaflet_visibility: String) {
  html.div([], [
    maplibre_map(maplibre_visibility),
    leaflet_map(leaflet_visibility),
  ])
}

fn maplibre_map(visibility: String) {
  let map_container =
    element.unsafe_raw_html(
      "",
      "div",
      [
        attribute.id("maplibre"),
        attribute.class("rounded-md aspect-square w-[min(90vw,90vh)]"),
      ],
      "",
    )

  html.div([attribute.class("col-span-1 " <> visibility)], [
    keyed.div([attribute.class("h-screen flex justify-center items-center")], [
      #("maplibre", map_container),
    ]),
  ])
}

fn leaflet_map(visibility: String) {
  html.div([attribute.class("col-span-1" <> visibility)], [
    html.p([], [html.text("todo: leaflet")]),
  ])
}
