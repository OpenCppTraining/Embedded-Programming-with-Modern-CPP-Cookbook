# Building

## Prerequisites

- CMake 3.25 or newer
- Ninja
- A C++20 compiler for each preset you use:

| Presets | Compiler | Verified with |
|---------|----------|---------------|
| `linux-gcc-*` | `g++` | GCC 13.3, Ubuntu 24.04 |
| `linux-clang-*` | `clang++` | Clang 18.1, Ubuntu 24.04 |
| `linux-arm-gnueabi-*` | `arm-linux-gnueabi-g++` (ARM, soft-float) | GCC 13.3, Ubuntu 24.04 |
| `linux-arm-gnueabihf-*` | `arm-linux-gnueabihf-g++` (ARM, hard-float) | GCC 13.3, Ubuntu 24.04 |
| `macos-appleclang-*` | `/usr/bin/clang++` | AppleClang 21, macOS 26 |

On Debian or Ubuntu:

```bash
sudo apt install cmake ninja-build g++ clang g++-arm-linux-gnueabi g++-arm-linux-gnueabihf
```

On macOS, install Xcode or its command line tools (`xcode-select --install`), then
CMake and Ninja, for example with `brew install cmake ninja`.

### Optional libraries

| Recipes | Library | Debian or Ubuntu package |
|---------|---------|--------------------------|
| `gpio`, `pwm` | wiringPi | Not packaged; build it from source on a Raspberry Pi |
| `gpiod` | libgpiod 1.x C++ bindings | `libgpiod-dev` (Ubuntu 24.04 ships 1.6) |
| `usb` | libudev | `libudev-dev` |
| `flat` | FlatBuffers | `libflatbuffers-dev` |

A recipe whose library is missing is skipped, with a message at configure time
such as `-- libudev not found: skipping usb`. The ARM presets look for libraries
only under `/usr/arm-linux-gnueabi` or `/usr/arm-linux-gnueabihf`, so they skip
these recipes unless the library is installed there.

## Build everything

```bash
cmake --list-presets                        # presets for this machine
cmake --workflow --preset linux-gcc-debug   # configure, build and test
```

Or step by step:

```bash
cmake --preset linux-gcc-debug
cmake --build --preset build-linux-gcc-debug
ctest --preset test-linux-gcc-debug
```

Each preset comes in `debug`, `dev` (RelWithDebInfo) and `release` variants. See
[ARCHITECTURE.md](ARCHITECTURE.md#presets) for how they are organized.

To build a single recipe, name its target:

```bash
cmake --build --preset build-linux-gcc-debug --target mutex
```

## Output

Executables go to `out/build/<preset>/Sources/ChapterNN/`. The three `loop` recipes
of chapter 5 go to `out/build/<preset>/Sources/Chapter05/<recipe>/loop`. Every
preset also writes `out/build/<preset>/compile_commands.json` for clangd and other
tools.

## The book's per-recipe builds

Each recipe can still be built on its own, as the book describes:

```bash
cd Sources/Chapter07/mutex
cmake -B build
cmake --build build
```

These builds use the standard each recipe sets, and most of them require
`/usr/bin/arm-linux-gnueabi-g++`; see
[ARCHITECTURE.md](ARCHITECTURE.md#the-per-recipe-builds).

Chapter 4 (8051, SDCC) and chapter 15 (Arduino) are built with their own tools, as
described in the book.
