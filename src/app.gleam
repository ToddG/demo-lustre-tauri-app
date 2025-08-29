// IMPORTS ---------------------------------------------------------------------

import gleam/int
import logger_ffi
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

// import maplibre_gl_js_ffi

// MAIN ------------------------------------------------------------------------

pub fn main() {
  logger_ffi.info("main app.gleam startup")
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
  Nil
}

// MODEL -----------------------------------------------------------------------

/// The `Model` is the state of our entire application.
///
type Model =
  Int

/// The `init` function gets called when we first start our app. It sets the
/// initial state of the app.
///
fn init(_) -> Model {
  0
}

// UPDATE ----------------------------------------------------------------------

/// The `Msg` type describes all the ways the outside world can talk to our app.
/// That includes user input, network requests, and any other external events.
///
type Msg {
  UserClickedIncrement
  UserClickedDecrement
}

/// The `update` function is called every time we receive a message from the
/// outside world. We get the message and the current state of the app, and we
/// use those to calculate the new state.
///
fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedIncrement -> {
      logger_ffi.debug("user clicked increment")
      model + 1
    }
    UserClickedDecrement -> {
      logger_ffi.debug("user clicked decrement")
      model - 1
    }
  }
}

// VIEW ------------------------------------------------------------------------

/// The `view` function is called after every `update`. It takes the current
/// state of our application and renders it as an `Element`
///
fn view(model: Model) -> Element(Msg) {
  let count = int.to_string(model)

  let style_page =
    "bg-white dark:bg-gray-800 h-screen flex flex-col justify-center items-center"
  let style_button =
    "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"

  let html_div =
    html.div(
      [
        attribute.class(style_page),
      ],
      [
        view_button(UserClickedDecrement, "(-) decrement", style_button),
        html.p([], [html.text("Count: "), html.text(count)]),
        view_button(UserClickedIncrement, "(+) increment", style_button),
      ],
    )
  // let map_style = "width: 400px; height: 300px;"
  // html.div([attribute.class(map_style), attribute.id("map")], []),
  // maplibre_gl_js_ffi.new_map("map")
  html_div
}

fn view_button(
  on_click handle_click: msg,
  label text: String,
  attribute style: String,
) -> Element(msg) {
  html.button([event.on_click(handle_click), attribute.class(style)], [
    html.text(text),
  ])
}
