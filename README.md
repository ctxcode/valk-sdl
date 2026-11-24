# valk-sdl

[SDL3](https://libsdl.org) bindings for [Valk](https://valk-lang.dev).

Provides safe, idiomatic Valk wrappers for SDL3 windows, displays, 2D rendering, streaming textures, events, input, text input, cursors, clipboard, and native message boxes.

## Requirements

Valk 0.9.1+. Prebuilt SDL3 libraries are bundled directly in `libs/<target>/`:
- `linux-x64`, `linux-arm64`: static `libSDL3.a` (glibc 2.27+, runtime `dlopen` for X11/Wayland/OpenGL/Vulkan — single self-contained binary).
- `win-x64`: static `SDL3.lib` + Win32 import stubs (single self-contained `.exe`, no `SDL3.dll`).
- `macos-x64`, `macos-arm64`: universal `libSDL3.dylib`.

Install with bundled libraries enabled:

```sh
vman install github.com/ctxcode/valk-sdl --libs
```

Or add `"libs": true` on the `sdl` entry in your project's `valk.json`. To regenerate the bundled libraries from source, run `./scripts/build-libs.sh`.

## Example

```rust
use sdl

fn main() {
    sdl.init(sdl.INIT_VIDEO) ! exit(1)
    defer { sdl.quit() }

    let win = sdl.Window.create("Hello SDL3", 800, 500, sdl.WINDOW_RESIZABLE) ! exit(1)
    defer { win.destroy() }

    let ren = sdl.Renderer.create(win) ! exit(1)
    defer { ren.destroy() }
    ren.set_vsync(1)

    let running = true
    while running {
        while true {
            let ev = sdl.poll_event() ?! break
            if ev.type == sdl.EVENT_QUIT : running = false
        }
        ren.set_draw_color(18, 22, 32, 255)
        ren.clear()
        ren.set_draw_color(79, 143, 247, 255)
        ren.fill_rect(.{ x: 100, y: 100, w: 200, h: 120 })
        ren.present()
    }
}
```

## Development

```sh
make test
make lint
make example
make docs
```
