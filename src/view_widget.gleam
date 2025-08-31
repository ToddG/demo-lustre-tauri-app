import lustre/attribute
import lustre/element/html
import update_messages.{UserClickedDecrement, UserClickedIncrement}
import view_button

pub fn widget(button_class: String, count: String) {
  html.div([attribute.class("col-span-1")], [
    view_button.button(UserClickedDecrement, "(-) decrement", button_class),
    html.p([], [html.text("Count: "), html.text(count)]),
    view_button.button(UserClickedIncrement, "(+) increment", button_class),
  ])
}
