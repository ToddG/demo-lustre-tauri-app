// import { warn, debug, trace, info, error } from '@tauri-apps/plugin-log';
import { debug as tauri_debug } from "@tauri-apps/plugin-log";

export function debug(msg: string) {
  tauri_debug(msg);
}
