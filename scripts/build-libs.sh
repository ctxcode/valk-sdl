#!/usr/bin/env bash
set -euo pipefail

SDL_VERSION="${SDL_VERSION:-3.4.20}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LIBS_DIR="$ROOT/libs"
mkdir -p \
  "$LIBS_DIR/linux-x64" \
  "$LIBS_DIR/linux-arm64" \
  "$LIBS_DIR/win-x64" \
  "$LIBS_DIR/macos-x64" \
  "$LIBS_DIR/macos-arm64"

TMP_DOCKER_CFG="$(mktemp -d)"
trap 'rm -rf "$TMP_DOCKER_CFG"' EXIT
printf '{}' > "$TMP_DOCKER_CFG/config.json"

echo "=== 1/3: Building portable static libSDL3.a for linux-x64 & linux-arm64 (glibc 2.27, full SDL3) ==="
DOCKER_CONFIG="$TMP_DOCKER_CFG" docker run --rm \
  -e SDL_VERSION="$SDL_VERSION" \
  -v "$LIBS_DIR:/out" \
  ubuntu:18.04 bash -euo pipefail -c '
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq --no-install-recommends \
  ca-certificates curl xz-utils ninja-build pkg-config \
  gcc g++ gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
  libx11-dev libxext-dev libxrandr-dev libxcursor-dev libxfixes-dev \
  libxi-dev libxss-dev libxtst-dev \
  libwayland-dev libxkbcommon-dev wayland-protocols libegl1-mesa-dev \
  libasound2-dev libpulse-dev libdbus-1-dev libibus-1.0-dev

curl -fsSL "https://github.com/Kitware/CMake/releases/download/v3.31.6/cmake-3.31.6-linux-x86_64.tar.gz" \
  | tar -xz -C /usr/local --strip-components=1

mkdir -p /src
curl -fsSL "https://github.com/libsdl-org/SDL/releases/download/release-${SDL_VERSION}/SDL3-${SDL_VERSION}.tar.gz" \
  | tar -xz -C /src
SRC="/src/SDL3-${SDL_VERSION}"

COMMON_FLAGS=(
  -G Ninja
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  -DSDL_SHARED=OFF
  -DSDL_STATIC=ON
  -DSDL_TESTS=OFF
  -DSDL_EXAMPLES=OFF
  -DSDL_X11=ON
  -DSDL_X11_SHARED=ON
  -DSDL_WAYLAND=ON
  -DSDL_WAYLAND_SHARED=ON
  -DSDL_WAYLAND_LIBDECOR=OFF
  -DSDL_ALSA=ON
  -DSDL_ALSA_SHARED=ON
  -DSDL_PULSEAUDIO=ON
  -DSDL_PULSEAUDIO_SHARED=ON
  -DSDL_PIPEWIRE=OFF
  -DSDL_SNDIO=OFF
  -DSDL_JACK=OFF
  -DSDL_KMSDRM=OFF
  -DSDL_LIBUDEV=OFF
  -DSDL_OPENGL=ON
  -DSDL_OPENGLES=ON
  -DSDL_VULKAN=ON
)

cmake -S "$SRC" -B /build-x64 "${COMMON_FLAGS[@]}"
cmake --build /build-x64 --target SDL3-static -j"$(nproc)"
cp /build-x64/libSDL3.a /out/linux-x64/libSDL3.a

dpkg --add-architecture arm64
sed -i "s|deb http://archive.ubuntu.com/ubuntu/|deb [arch=amd64] http://archive.ubuntu.com/ubuntu/|g; s|deb http://security.ubuntu.com/ubuntu/|deb [arch=amd64] http://security.ubuntu.com/ubuntu/|g" /etc/apt/sources.list
cat >> /etc/apt/sources.list <<EOF
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports bionic main universe
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports bionic-updates main universe
deb [arch=arm64] http://ports.ubuntu.com/ubuntu-ports bionic-security main universe
EOF
apt-get update -qq
apt-get install -y -qq --no-install-recommends \
  libx11-dev:arm64 libxext-dev:arm64 libxrandr-dev:arm64 libxcursor-dev:arm64 libxfixes-dev:arm64 \
  libxi-dev:arm64 libxss-dev:arm64 libxtst-dev:arm64 \
  libwayland-dev:arm64 libxkbcommon-dev:arm64 libegl1-mesa-dev:arm64 \
  libasound2-dev:arm64 libpulse-dev:arm64 libdbus-1-dev:arm64

cat > /arm64-toolchain.cmake <<EOF
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)
set(CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu /usr/lib/aarch64-linux-gnu)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
EOF

PKG_CONFIG_LIBDIR=/usr/lib/aarch64-linux-gnu/pkgconfig:/usr/share/pkgconfig \
cmake -S "$SRC" -B /build-arm64 \
  -DCMAKE_TOOLCHAIN_FILE=/arm64-toolchain.cmake \
  "${COMMON_FLAGS[@]}"
cmake --build /build-arm64 --target SDL3-static -j"$(nproc)"
cp /build-arm64/libSDL3.a /out/linux-arm64/libSDL3.a
'

echo "=== 2/3: Building static SDL3.lib + Win32 import stubs for win-x64 ==="
DOCKER_CONFIG="$TMP_DOCKER_CFG" docker run --rm \
  -e SDL_VERSION="$SDL_VERSION" \
  -v "$LIBS_DIR:/out" \
  debian:bookworm-slim bash -euo pipefail -c '
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq --no-install-recommends \
  ca-certificates curl cmake ninja-build mingw-w64

mkdir -p /src
curl -fsSL "https://github.com/libsdl-org/SDL/releases/download/release-${SDL_VERSION}/SDL3-${SDL_VERSION}.tar.gz" \
  | tar -xz -C /src
SRC="/src/SDL3-${SDL_VERSION}"

cat > /win64-toolchain.cmake <<EOF
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)
set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
EOF

cmake -S "$SRC" -B /build-win64 \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_TOOLCHAIN_FILE=/win64-toolchain.cmake \
  -DSDL_SHARED=OFF \
  -DSDL_STATIC=ON \
  -DSDL_LIBC=OFF \
  -DSDL_TESTS=OFF \
  -DSDL_EXAMPLES=OFF
cmake --build /build-win64 --target SDL3-static -j"$(nproc)"
cp /build-win64/libSDL3.a /out/win-x64/SDL3.lib

# Rename internal CRT/stack-probe symbols so SDL3.lib links cleanly with MSVC libvcruntime/libcmt
x86_64-w64-mingw32-objcopy \
  --redefine-sym memcpy=__sdl_internal_memcpy \
  --redefine-sym memmove=__sdl_internal_memmove \
  --redefine-sym memset=__sdl_internal_memset \
  --redefine-sym ___chkstk_ms=__chkstk \
  /out/win-x64/SDL3.lib

# Copy standard Win32 import libraries not included in Valk base win-x64 sysroot
for lib in gdi32 winmm imm32 ole32 oleaut32 version uuid setupapi shell32 cfgmgr32; do
  cp "/usr/x86_64-w64-mingw32/lib/lib${lib}.a" "/out/win-x64/${lib}.lib"
done
chown -R '"$(id -u):$(id -g)"' /out/linux-x64 /out/linux-arm64 /out/win-x64
'

echo "=== 3/3: Extracting official universal macOS libSDL3.dylib ==="
TMP_MAC="$(mktemp -d)"
curl -fsSL -o "$TMP_MAC/SDL3.dmg" "https://github.com/libsdl-org/SDL/releases/download/release-${SDL_VERSION}/SDL3-${SDL_VERSION}.dmg"
7z x -y "$TMP_MAC/SDL3.dmg" "SDL3/SDL3.xcframework/macos-arm64_x86_64/SDL3.framework/Versions/A/SDL3" -o"$TMP_MAC/ext" >/dev/null
cp "$TMP_MAC/ext/SDL3/SDL3.xcframework/macos-arm64_x86_64/SDL3.framework/Versions/A/SDL3" "$LIBS_DIR/macos-x64/libSDL3.dylib"
cp "$TMP_MAC/ext/SDL3/SDL3.xcframework/macos-arm64_x86_64/SDL3.framework/Versions/A/SDL3" "$LIBS_DIR/macos-arm64/libSDL3.dylib"
rm -rf "$TMP_MAC"

echo "=== Summary ==="
ls -lh "$LIBS_DIR"/linux-x64 "$LIBS_DIR"/linux-arm64 "$LIBS_DIR"/win-x64 "$LIBS_DIR"/macos-x64 "$LIBS_DIR"/macos-arm64
