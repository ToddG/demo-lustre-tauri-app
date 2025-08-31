// <!doctype html>
// <html lang="en">
//   <head>
//     <meta charset="UTF-8" />
//     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
//     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
//     <title>Navbar | TailGrids</title>
//     <link
//       rel="shortcut icon"
//       href="../../assets/images/favicon.svg"
//       type="image/x-icon"
//     />
//     <link rel="stylesheet" href="../../assets/css/tailwind.css" />

//     <script defer src="../../assets/js/alpine.min.js"></script>
//   </head>
//   <body>
//     <!-- ====== Navbar Section Start -->
//     <header
//       x-data="
//         {
//           navbarOpen: false
//         }
//       "
//       class="flex w-full items-center bg-white dark:bg-dark"
//     >
//       <div class="container mx-auto">
//         <div class="relative -mx-4 flex items-center justify-between">
//           <div class="w-60 max-w-full px-4">
//             <a href="javascript:void(0)" class="block w-full py-5">
//               <img
//                 src="https://cdn.tailgrids.com/2.0/image/assets/images/logo/logo-primary.svg"
//                 alt="logo"
//                 class="dark:hidden"
//               />
//               <img
//                 src="https://cdn.tailgrids.com/2.0/image/assets/images/logo/logo-white.svg"
//                 alt="logo"
//                 class="hidden dark:block"
//               />
//             </a>
//           </div>
//           <div class="flex w-full items-center justify-between px-4">
//             <div>
//               <button
//                 @click="navbarOpen = !navbarOpen"
//                 :class="navbarOpen && 'navbarTogglerActive' "
//                 id="navbarToggler"
//                 class="absolute right-4 top-1/2 block -translate-y-1/2 rounded-lg px-3 py-[6px] ring-primary focus:ring-2 lg:hidden"
//               >
//                 <span
//                   class="relative my-[6px] block h-[2px] w-[30px] bg-body-color dark:bg-white"
//                 ></span>
//                 <span
//                   class="relative my-[6px] block h-[2px] w-[30px] bg-body-color dark:bg-white"
//                 ></span>
//                 <span
//                   class="relative my-[6px] block h-[2px] w-[30px] bg-body-color dark:bg-white"
//                 ></span>
//               </button>
//               <nav
//                 :class="!navbarOpen && 'hidden' "
//                 id="navbarCollapse"
//                 class="absolute right-4 top-full w-full max-w-[250px] rounded-lg bg-white px-6 py-5 shadow lg:static lg:block lg:w-full lg:max-w-full lg:shadow-none dark:bg-dark-2 lg:dark:bg-transparent"
//               >
//                 <ul class="block lg:flex">
//                   <li>
//                     <a
//                       href="javascript:void(0)"
//                       class="flex py-2 text-base font-medium text-body-color hover:text-dark lg:ml-12 lg:inline-flex dark:text-dark-6 dark:hover:text-white"
//                     >
//                       Home
//                     </a>
//                   </li>
//                   <li>
//                     <a
//                       href="javascript:void(0)"
//                       class="flex py-2 text-base font-medium text-body-color hover:text-dark lg:ml-12 lg:inline-flex dark:text-dark-6 dark:hover:text-white"
//                     >
//                       Payment
//                     </a>
//                   </li>
//                   <li>
//                     <a
//                       href="javascript:void(0)"
//                       class="flex py-2 text-base font-medium text-body-color hover:text-dark lg:ml-12 lg:inline-flex dark:text-dark-6 dark:hover:text-white"
//                     >
//                       Features
//                     </a>
//                   </li>
//                 </ul>
//               </nav>
//             </div>
//             <div class="hidden justify-end pr-16 sm:flex lg:pr-0">
//               <a
//                 href="javascript:void(0)"
//                 class="px-7 py-3 text-base font-medium text-dark hover:text-primary dark:text-white"
//               >
//                 Login
//               </a>
//               <a
//                 href="javascript:void(0)"
//                 class="rounded-md bg-primary px-7 py-3 text-base font-medium text-white hover:bg-primary/90"
//               >
//                 Sign Up
//               </a>
//             </div>
//           </div>
//         </div>
//       </div>
//     </header>
//     <!-- ====== Navbar Section End -->
//   </body>
// </html>
import lustre/attribute
import lustre/element/html
import update_messages
import view_button

// TODO : use ideas from above html snippet in navbar below
//
pub fn navbar() {
  html.div([], [
    html.nav([attribute.class("bg-purple-700 text-white py-4")], [
      html.div([attribute.class("col-span-1")], [
        html.div(
          [
            // attribute.class(
          //   "container mx-auto flex items-center justify-between",
          // ),
          ],
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
    ]),
  ])
}
