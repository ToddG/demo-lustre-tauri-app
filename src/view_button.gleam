import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

pub fn default_class() {
  "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
}

pub fn button(
  on_click handle_click: msg,
  label text: String,
  attribute class: String,
) -> Element(msg) {
  html.button([event.on_click(handle_click), attribute.class(class)], [
    html.text(text),
  ])
}
