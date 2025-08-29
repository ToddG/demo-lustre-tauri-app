// Q: is it possible to directly import from tauri? Doesn't work for me but could
// be that other errors are masking this...
// @external(javascript, "../src-tauri/@tauri-apps/plugin-log", "debug")
// pub fn debug(msg: String) -> Nil

// Q: this did not work for me either
@external(javascript, "./tauri-plugin-log-shim.ts", "debug")
pub fn debug(msg: String) -> Nil
