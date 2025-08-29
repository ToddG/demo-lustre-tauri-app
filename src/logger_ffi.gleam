@external(javascript, "./tauri_plugin_log_ffi.ts", "debug")
pub fn debug(msg: String) -> Nil

@external(javascript, "./tauri-plugin-log-ffi.ts", "error")
pub fn error(msg: String) -> Nil

@external(javascript, "./tauri-plugin-log-ffi.ts", "info")
pub fn info(msg: String) -> Nil

@external(javascript, "./tauri-plugin-log-ffi.ts", "trace")
pub fn trace(msg: String) -> Nil

@external(javascript, "./tauri-plugin-log-ffi.ts", "warn")
pub fn warn(msg: String) -> Nil
