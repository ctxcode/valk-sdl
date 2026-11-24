
# Documentation

Namespaces: [main](#main)

---

# main

## Aliases for 'main'

```js
+ value BLENDMODE_ADD (0x00000002)
+ value BLENDMODE_BLEND (0x00000001)
+ value BLENDMODE_BLEND_PREMULTIPLIED (0x00000010)
+ value BLENDMODE_MOD (0x00000004)
+ value BLENDMODE_MUL (0x00000008)
+ value BLENDMODE_NONE (0x00000000)
+ value BUTTON_LEFT (1)
+ value BUTTON_LMASK (1)
+ value BUTTON_MIDDLE (2)
+ value BUTTON_MMASK (2)
+ value BUTTON_RIGHT (3)
+ value BUTTON_RMASK (4)
+ value BUTTON_X1 (4)
+ value BUTTON_X2 (5)
+ value EVENT_DROP_BEGIN (0x1002)
+ value EVENT_DROP_COMPLETE (0x1003)
+ value EVENT_DROP_FILE (0x1000)
+ value EVENT_DROP_TEXT (0x1001)
+ value EVENT_KEY_DOWN (0x300)
+ value EVENT_KEY_UP (0x301)
+ value EVENT_MOUSE_BUTTON_DOWN (0x401)
+ value EVENT_MOUSE_BUTTON_UP (0x402)
+ value EVENT_MOUSE_MOTION (0x400)
+ value EVENT_MOUSE_WHEEL (0x403)
+ value EVENT_QUIT (0x100)
+ value EVENT_TEXT_EDITING (0x302)
+ value EVENT_TEXT_INPUT (0x303)
+ value EVENT_WINDOW_CLOSE_REQUESTED (0x210)
+ value EVENT_WINDOW_DISPLAY_SCALE_CHANGED (0x214)
+ value EVENT_WINDOW_EXPOSED (0x204)
+ value EVENT_WINDOW_FOCUS_GAINED (0x20e)
+ value EVENT_WINDOW_FOCUS_LOST (0x20f)
+ value EVENT_WINDOW_HIDDEN (0x203)
+ value EVENT_WINDOW_MAXIMIZED (0x20a)
+ value EVENT_WINDOW_MINIMIZED (0x209)
+ value EVENT_WINDOW_MOUSE_ENTER (0x20c)
+ value EVENT_WINDOW_MOUSE_LEAVE (0x20d)
+ value EVENT_WINDOW_MOVED (0x205)
+ value EVENT_WINDOW_PIXEL_SIZE_CHANGED (0x207)
+ value EVENT_WINDOW_RESIZED (0x206)
+ value EVENT_WINDOW_RESTORED (0x20b)
+ value EVENT_WINDOW_SHOWN (0x202)
+ value HINT_RENDER_DRIVER ("SDL_RENDER_DRIVER")
+ value HINT_RENDER_VSYNC ("SDL_RENDER_VSYNC")
+ value HINT_VIDEO_DRIVER ("SDL_VIDEO_DRIVER")
+ value HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR ("SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR")
+ value INIT_AUDIO (0x00000010)
+ value INIT_CAMERA (0x00010000)
+ value INIT_EVENTS (0x00004000)
+ value INIT_GAMEPAD (0x00002000)
+ value INIT_HAPTIC (0x00001000)
+ value INIT_JOYSTICK (0x00000200)
+ value INIT_SENSOR (0x00008000)
+ value INIT_VIDEO (0x00000020)
+ value KMOD_ALT (0x0300)
+ value KMOD_CTRL (0x00c0)
+ value KMOD_GUI (0x0c00)
+ value KMOD_LALT (0x0100)
+ value KMOD_LCTRL (0x0040)
+ value KMOD_LGUI (0x0400)
+ value KMOD_LSHIFT (0x0001)
+ value KMOD_NONE (0x0000)
+ value KMOD_RALT (0x0200)
+ value KMOD_RCTRL (0x0080)
+ value KMOD_RGUI (0x0800)
+ value KMOD_RSHIFT (0x0002)
+ value KMOD_SHIFT (0x0003)
+ value MESSAGEBOX_ERROR (0x00000010)
+ value MESSAGEBOX_INFORMATION (0x00000040)
+ value MESSAGEBOX_WARNING (0x00000020)
+ value MOUSEWHEEL_FLIPPED (1)
+ value MOUSEWHEEL_NORMAL (0)
+ value PIXELFORMAT_ABGR8888 (0x16762004)
+ value PIXELFORMAT_ARGB8888 (0x16362004)
+ value PIXELFORMAT_BGRA8888 (0x16862004)
+ value PIXELFORMAT_RGB24 (0x17101803)
+ value PIXELFORMAT_RGBA32 (0x16762004)
+ value PIXELFORMAT_RGBA8888 (0x16462004)
+ value SDLK_0 (0x30)
+ value SDLK_9 (0x39)
+ value SDLK_A (0x61)
+ value SDLK_APOSTROPHE (0x27)
+ value SDLK_BACKSLASH (0x5c)
+ value SDLK_BACKSPACE (0x08)
+ value SDLK_COMMA (0x2c)
+ value SDLK_DELETE (0x7f)
+ value SDLK_DOWN (0x40000051)
+ value SDLK_END (0x4000004d)
+ value SDLK_EQUALS (0x3d)
+ value SDLK_ESCAPE (0x1b)
+ value SDLK_F1 (0x4000003a)
+ value SDLK_F12 (0x40000045)
+ value SDLK_GRAVE (0x60)
+ value SDLK_HOME (0x4000004a)
+ value SDLK_INSERT (0x40000049)
+ value SDLK_KP_ENTER (0x40000058)
+ value SDLK_LALT (0x400000e2)
+ value SDLK_LCTRL (0x400000e0)
+ value SDLK_LEFT (0x40000050)
+ value SDLK_LEFTBRACKET (0x5b)
+ value SDLK_LGUI (0x400000e3)
+ value SDLK_LSHIFT (0x400000e1)
+ value SDLK_MINUS (0x2d)
+ value SDLK_PAGEDOWN (0x4000004e)
+ value SDLK_PAGEUP (0x4000004b)
+ value SDLK_PERIOD (0x2e)
+ value SDLK_RALT (0x400000e6)
+ value SDLK_RCTRL (0x400000e4)
+ value SDLK_RETURN (0x0d)
+ value SDLK_RGUI (0x400000e7)
+ value SDLK_RIGHT (0x4000004f)
+ value SDLK_RIGHTBRACKET (0x5d)
+ value SDLK_RSHIFT (0x400000e5)
+ value SDLK_SEMICOLON (0x3b)
+ value SDLK_SLASH (0x2f)
+ value SDLK_SPACE (0x20)
+ value SDLK_TAB (0x09)
+ value SDLK_UP (0x40000052)
+ value SDLK_Z (0x7a)
+ value WINDOWPOS_CENTERED (0x2fff0000)
+ value WINDOWPOS_UNDEFINED (0x1fff0000)
+ value WINDOW_ALWAYS_ON_TOP (0x0000000000010000)
+ value WINDOW_BORDERLESS (0x0000000000000010)
+ value WINDOW_FULLSCREEN (0x0000000000000001)
+ value WINDOW_HIDDEN (0x0000000000000008)
+ value WINDOW_HIGH_PIXEL_DENSITY (0x0000000000002000)
+ value WINDOW_INPUT_FOCUS (0x0000000000000200)
+ value WINDOW_MAXIMIZED (0x0000000000000080)
+ value WINDOW_METAL (0x0000000020000000)
+ value WINDOW_MINIMIZED (0x0000000000000040)
+ value WINDOW_MOUSE_FOCUS (0x0000000000000400)
+ value WINDOW_MOUSE_GRABBED (0x0000000000000100)
+ value WINDOW_OCCLUDED (0x0000000000000004)
+ value WINDOW_OPENGL (0x0000000000000002)
+ value WINDOW_POPUP_MENU (0x0000000000080000)
+ value WINDOW_RESIZABLE (0x0000000000000020)
+ value WINDOW_TOOLTIP (0x0000000000040000)
+ value WINDOW_TRANSPARENT (0x0000000040000000)
+ value WINDOW_UTILITY (0x0000000000020000)
+ value WINDOW_VULKAN (0x0000000010000000)
```

## Enums for 'main'

```js
+ enum FlipMode : i32 { none (0), horizontal (1), vertical (2) }
+ enum LogicalPresentation : i32 { disabled (0), stretch (1), letterbox (2), overscan (3), integer_scale (4) }
+ enum ScaleMode : i32 { nearest (0), linear (1) }
+ enum SystemCursor : i32 { default_ (0), text (1), wait (2), crosshair (3), progress (4), nwse_resize (5), nesw_resize (6), ew_resize (7), ns_resize (8), move (9), not_allowed (10), pointer (11) }
+ enum TextureAccess : i32 { static_ (0), streaming (1), target (2) }
```

## Functions for 'main'

```js
+ fn delay(ms: u32) void
+ fn delay_ns(ns: u64) void
+ fn get_clipboard_text() String
+ fn get_display_bounds(display_id: u32) ?Rect
+ fn get_display_usable_bounds(display_id: u32) ?Rect
+ fn get_error() String
+ fn get_hint(name: String) ?String
+ fn get_mod_state() u16
+ fn get_mouse_state() (u32, f32, f32)
+ fn get_num_render_drivers() i32
+ fn get_performance_counter() u64
+ fn get_performance_frequency() u64
+ fn get_primary_display() u32
+ fn get_render_driver(index: i32) String
+ fn get_ticks() u64
+ fn get_ticks_ns() u64
+ fn get_version() i32
+ fn has_clipboard_text() bool
+ fn init(flags: u32) void !SdlError
+ fn init_subsystem(flags: u32) void !SdlError
+ fn poll_event() ?Event
+ fn pump_events() void
+ fn push_event(event: Event) bool
+ fn quit() void
+ fn quit_subsystem(flags: u32) void
+ fn set_clipboard_text(text: String) bool
+ fn set_hint(name: String, value: String) bool
+ fn show_simple_message_box(flags: u32, title: String, message: String, window: ?Window (null)) bool
+ fn wait_event() ?Event
+ fn wait_event_timeout(timeout_ms: i32) ?Event
```

## Classes for 'main'

```js
+ struct Color {
    + a: u8
    + b: u8
    + g: u8
    + r: u8

    + static fn rgb(r: u8, g: u8, b: u8) Color
    + static fn rgba(r: u8, g: u8, b: u8, a: u8) Color
}
```

```js
// An SDL3 system cursor. Call `destroy()` when done.
+ class Cursor {
    + fn apply() bool
    + fn destroy() void
    + static fn system(kind: SystemCursor) Cursor !SdlError
}
```

```js
+ struct DropEvent {
    + timestamp: u64
    + type: u32
    + window_id: u32
    + x: f32
    + y: f32

    + get data: String
    + get source: String
}
```

```js
// 128-byte, 8-byte-aligned buffer matching `SDL_Event`.
+ struct Event {
    + fn button() MouseButtonEvent
    + fn drop() DropEvent
    + fn key() KeyboardEvent
    + fn motion() MouseMotionEvent
    + fn text() TextInputEvent
    + fn text_editing() TextEditingEvent
    + get type: u32
    + fn wheel() MouseWheelEvent
    + fn window() WindowEvent
}
```

```js
+ struct FColor {
    + a: f32
    + b: f32
    + g: f32
    + r: f32
}
```

```js
+ struct FPoint {
    + x: f32
    + y: f32
}
```

```js
+ struct FRect {
    + h: f32
    + w: f32
    + x: f32
    + y: f32
}
```

```js
+ struct KeyboardEvent {
    + down: bool
    + key: u32
    + mod: u16
    + raw: u16
    + repeat: bool
    + scancode: u32
    + timestamp: u64
    + type: u32
    + which: u32
    + window_id: u32
}
```

```js
+ struct MouseButtonEvent {
    + button: u8
    + clicks: u8
    + down: bool
    + timestamp: u64
    + type: u32
    + which: u32
    + window_id: u32
    + x: f32
    + y: f32
}
```

```js
+ struct MouseMotionEvent {
    + state: u32
    + timestamp: u64
    + type: u32
    + which: u32
    + window_id: u32
    + x: f32
    + xrel: f32
    + y: f32
    + yrel: f32
}
```

```js
+ struct MouseWheelEvent {
    + direction: u32
    + mouse_x: f32
    + mouse_y: f32
    + timestamp: u64
    + type: u32
    + which: u32
    + window_id: u32
    + x: f32
    + y: f32
}
```

```js
+ struct Point {
    + x: i32
    + y: i32
}
```

```js
+ struct Rect {
    + h: i32
    + w: i32
    + x: i32
    + y: i32
}
```

```js
// An SDL3 2D renderer (D3D11/12 on Windows, Metal on macOS, Vulkan/OpenGL/software on Linux).
+ class Renderer {
    + fn clear() bool
    + static fn create(window: Window, driver: String ("")) Renderer !SdlError
    + fn create_texture(format: u32, access: TextureAccess, w: i32, h: i32) Texture !SdlError
    + fn destroy() void
    + fn draw_line(x1: f32, y1: f32, x2: f32, y2: f32) bool
    + fn draw_point(x: f32, y: f32) bool
    + fn draw_rect(rect: FRect) bool
    + fn fill_rect(rect: FRect) bool
    + fn geometry(vertices: local &[Vertex], indices: local &[i32] (.{}), texture: ?Texture (null)) bool
    + fn name() String
    + fn present() bool
    + fn render_texture(texture: Texture, src: ?FRect (null), dst: ?FRect (null)) bool
    + fn set_clip_rect(rect: ?Rect) bool
    + fn set_draw_blend_mode(mode: u32) bool
    + fn set_draw_color(r: u8, g: u8, b: u8, a: u8 (255)) bool
    + fn set_logical_presentation(w: i32, h: i32, mode: LogicalPresentation) bool
    + fn set_scale(sx: f32, sy: f32) bool
    + fn set_vsync(vsync: i32) bool
}
```

```js
+ union SdlError {
    failed(String)

    + get message: String
    + fn to_string() String
}
```

```js
+ struct SurfaceHeader {
    + flags: u32
    + format: u32
    + h: i32
    + pitch: i32
    + pixels: ?ptr
    + w: i32
}
```

```js
+ struct TextEditingEvent {
    + length: i32
    + start: i32
    + timestamp: u64
    + type: u32
    + window_id: u32

    + get text: String
}
```

```js
+ struct TextInputEvent {
    + timestamp: u64
    + type: u32
    + window_id: u32

    + get text: String
}
```

```js
// An SDL3 GPU texture owned by a `Renderer`. Call `destroy()` when done.
+ class Texture {
    + handle: ?ptr
    + height: i32
    + width: i32

    + fn destroy() void
    + fn set_blend_mode(mode: u32) bool
    + fn set_scale_mode(mode: ScaleMode) bool
    + fn update(pixels: local &[u8], pitch: i32, rect: ?Rect (null)) bool
}
```

```js
+ struct Vertex {
    + color: FColor
    + position: FPoint
    + tex_coord: FPoint
}
```

```js
// An SDL3 OS window. Call `destroy()` when done.
+ class Window {
    + static fn create(title: String, width: i32, height: i32, flags: u64 (0)) Window !SdlError
    + fn destroy() void
    + fn display_id() u32
    + fn display_scale() f32
    + fn flags() u64
    + fn hide() bool
    + fn id() u32
    + fn is_maximized() bool
    + fn is_minimized() bool
    + fn maximize() bool
    + fn minimize() bool
    + fn pixel_density() f32
    + fn position() (i32, i32)
    + fn raise() bool
    + fn restore() bool
    + fn set_fullscreen(fullscreen: bool) bool
    + fn set_icon_rgba(width: i32, height: i32, rgba: local &[u8]) bool
    + fn set_maximum_size(max_w: i32, max_h: i32) bool
    + fn set_minimum_size(min_w: i32, min_h: i32) bool
    + fn set_opacity(opacity: f32) bool
    + fn set_position(x: i32, y: i32) bool
    + fn set_resizable(resizable: bool) bool
    + fn set_size(w: i32, h: i32) bool
    + fn set_text_input_area(rect: Rect, cursor: i32 (0)) bool
    + fn set_title(title: String) bool
    + fn show() bool
    + fn size() (i32, i32)
    + fn size_in_pixels() (i32, i32)
    + fn start_text_input() bool
    + fn stop_text_input() bool
    + fn sync() bool
    + fn title() String
}
```

```js
+ struct WindowEvent {
    + data1: i32
    + data2: i32
    + timestamp: u64
    + type: u32
    + window_id: u32
}
```
