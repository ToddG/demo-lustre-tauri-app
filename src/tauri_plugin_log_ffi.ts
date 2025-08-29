import {
  debug as tauri_debug,
  error as tauri_error,
  info as tauri_info,
  trace as tauri_trace,
  warn as tauri_warn,
} from "@tauri-apps/plugin-log";

export function debug(msg: string) {
  tauri_debug(msg);
}
export function error(msg: string) {
  tauri_error(msg);
}
export function info(msg: string) {
  tauri_info(msg);
}
export function trace(msg: string) {
  tauri_debug(msg);
}
export function warn(msg: string) {
  tauri_warn(msg);
}
