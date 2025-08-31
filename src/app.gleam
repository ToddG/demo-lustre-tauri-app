// IMPORTS ---------------------------------------------------------------------

import gleam/int
import logger_ffi
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import maplibre_gl_js_ffi
import update_messages
import view_button
import view_footer
import view_map
import view_navbar
import view_widget

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
type MapChoice {
  MapLibre
  Leaflet
}

type Model {
  Model(counter: Int, map_choice: MapChoice)
}

/// The `init` function gets called when we first starsetup_mapss. It sets the
/// initisetup_mapspsf the app.
///
fn init(_) {
  let effect = setup_maps()
  #(Model(0, MapLibre), effect)
}

fn setup_maps() {
  use _, _ <- effect.before_paint
  maplibre_gl_js_ffi.new_map("maplibre")
  Nil
}

// UPDATE ----------------------------------------------------------------------

/// The `update` function is called every time we receive a message from the
/// outside world. We get the message and the current state of the app, and we
/// use those to calculate the new state.
///
fn update(model: Model, msg: update_messages.Msg) -> #(Model, Effect(msg)) {
  case msg {
    update_messages.UserClickedIncrement -> {
      logger_ffi.debug("user clicked increment")
      #(Model(..model, counter: model.counter + 1), effect.none())
    }
    update_messages.UserClickedDecrement -> {
      logger_ffi.debug("user clicked decrement")
      #(Model(..model, counter: model.counter - 1), effect.none())
    }
    update_messages.UserClickedShowLeafletMap -> {
      logger_ffi.debug("user clicked show leaflet map")
      #(Model(..model, map_choice: Leaflet), effect.none())
    }
    update_messages.UserClickedShowMapLibreMap -> {
      logger_ffi.debug("user clicked show maplibre map")
      #(Model(..model, map_choice: MapLibre), effect.none())
    }
  }
}

// VIEW ------------------------------------------------------------------------

/// The `view` function is called after every `update`. It takes the current
/// state of our application and renders it as an `Element`
///
fn view(model: Model) -> Element(update_messages.Msg) {
  let count = int.to_string(model.counter)

  let #(maplibre_visibility, leaflet_visibility) = case model.map_choice {
    Leaflet -> #("collapse", "visible")
    MapLibre -> #("visible", "collapse")
  }

  html.div(
    [
      attribute.class(
        "flex w-full items-center bg-white dark:bg-dark text-white py-4",
      ),
    ],
    [
      html.div([attribute.class("grid grid-cols-3 gap-1")], [
        view_navbar.navbar(),
        view_widget.widget(view_button.default_class(), count),
        view_map.map(maplibre_visibility, leaflet_visibility),
        view_footer.footer(),
      ]),
    ],
  )
}
