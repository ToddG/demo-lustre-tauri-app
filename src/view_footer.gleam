import lustre/attribute
import lustre/element/html

pub fn footer() {
  html.div([attribute.class("col-span-3 bg-green-900")], [
    html.p([], [html.text("TODO ADD FOOTER")]),
  ])
}
