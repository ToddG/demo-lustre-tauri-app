import lustre/attribute
import lustre/element/html
import update_messages
import view_button

pub fn navbar() {
  html.div([attribute.class("bg-green-900 col-span-3")], [
    html.nav(
      [
        attribute.class("relative -mx-4"),
      ],
      [
        html.div([attribute.class("grid grid-cols-4 gap-4")], [
          html.div([], [
            html.div([attribute.class("w-60 max-w-full px-4")], [
              html.img([
                attribute.class("rounded-full h-24 w-24 mr-2"),
                attribute.src("/priv/static/roboxel-tree.svg"),
                attribute.alt("profile image"),
              ]),
              html.h1([attribute.class("text-2xl font-bold")], [
                html.text("HELLO"),
              ]),
            ]),
          ]),
          html.div([], []),
          html.div([], []),
          html.div(
            [
              attribute.class(
                "flex w-full items-center justify-between justify-items-end px-4",
              ),
            ],
            [
              html.ul([attribute.class("flex space-x-8")], [
                html.li([], [
                  view_button.button(
                    update_messages.UserClickedShowMapLibreMap,
                    "show maplibre map",
                    view_button.default_class(),
                  ),
                ]),
                html.li([], [
                  view_button.button(
                    update_messages.UserClickedShowLeafletMap,
                    "show leaflet map",
                    view_button.default_class(),
                  ),
                ]),
              ]),
            ],
          ),
        ]),
      ],
    ),
  ])
}
