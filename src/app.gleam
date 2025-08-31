// IMPORTS ---------------------------------------------------------------------

import gleam/int
import logger_ffi
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/element/keyed
import lustre/event
import maplibre_gl_js_ffi

// MAIN ------------------------------------------------------------------------

pub fn main() {
  logger_ffi.info("main app.gleam startup")
  let app = lustre.application(init, update, view)
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
fn init(_) {
  let effect = setup_map()
  #(0, effect)
}

fn setup_map() {
  use _, _ <- effect.before_paint
  maplibre_gl_js_ffi.new_map("map")
  Nil
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
fn update(model: Model, msg: Msg) -> #(Model, Effect(msg)) {
  case msg {
    UserClickedIncrement -> {
      logger_ffi.debug("user clicked increment")
      #(model + 1, effect.none())
    }
    UserClickedDecrement -> {
      logger_ffi.debug("user clicked decrement")
      #(model - 1, effect.none())
    }
  }
}

// VIEW ------------------------------------------------------------------------

/// The `view` function is called after every `update`. It takes the current
/// state of our application and renders it as an `Element`
///
fn view(model: Model) -> Element(Msg) {
  let count = int.to_string(model)

  let page_class = "bg-white dark:bg-gray-800 text-white py-4"
  let button_class =
    "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"

  let map_container =
    element.unsafe_raw_html(
      "",
      "div",
      [
        attribute.id("map"),
        attribute.class("rounded-md aspect-square w-[min(90vw,90vh)]"),
      ],
      "",
    )

  let app_div =
    html.nav([attribute.class("bg-purple-700 text-white py-4")], [
      html.div(
        [attribute.class("container mx-auto flex items-center justify-between")],
        [
          html.div([attribute.class("flex items-center")], [
            html.img([
              attribute.class("rounded-full h-12 w-12 mr-2"),
              attribute.src(
                "https://cdn.pixabay.com/photo/2014/04/02/17/07/user-307993_1280.png",
              ),
              attribute.alt("profile image"),
            ]),
            html.h1([attribute.class("text-2xl font-bold")], [
              html.text("FOOBAR!!!"),
            ]),
          ]),
          html.ul([attribute.class("flex space-x-8")], [
            html.li([], [
              view_button(UserClickedDecrement, "(-) decrement", button_class),
            ]),
            html.li([], [html.p([], [html.text("Count: "), html.text(count)])]),
            html.li([], [
              view_button(UserClickedIncrement, "(+) increment", button_class),
            ]),
          ]),
        ],
      ),
      html.div([attribute.class(page_class <> "grid grid-cols-3 gap-4")], [
        html.div(
          [attribute.class("grid grid-cols-1")],
          buttons(button_class, count),
        ),
        html.div([attribute.class("grid grid-cols-1")], [
          maplibre_map(map_container),
        ]),
        html.div([], []),
      ]),
    ])
  app_div
}

fn buttons(button_class: String, count: String) {
  [
    view_button(UserClickedDecrement, "(-) decrement", button_class),
    html.p([], [html.text("Count: "), html.text(count)]),
    view_button(UserClickedIncrement, "(+) increment", button_class),
  ]
}

fn maplibre_map(map_container: Element(msg)) {
  keyed.div([attribute.class("h-screen flex justify-center items-center")], [
    #("map", map_container),
  ])
}

fn view_button(
  on_click handle_click: msg,
  label text: String,
  attribute class: String,
) -> Element(msg) {
  html.button([event.on_click(handle_click), attribute.class(class)], [
    html.text(text),
  ])
}
