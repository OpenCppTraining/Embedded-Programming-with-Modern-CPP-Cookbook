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

## Building in a container

`Dockerfile` describes an Ubuntu 24.04 image with every toolchain of the `linux-*`
presets, the optional libraries except wiringPi, `qemu-user`, gdb, clang-format,
clang-tidy, clangd and cmake-format. It runs the Linux and ARM presets on any
machine with Docker, macOS included.

### Docker

```bash
docker build -t embedded-cookbook .
docker run --rm -v "$PWD":/workspace embedded-cookbook cmake --workflow --preset linux-gcc-debug
docker run --rm -it -v "$PWD":/workspace embedded-cookbook bash   # a shell
```

The container runs as the image's `ubuntu` user, UID 1000. On a Linux host where
your UID differs, add `--user "$(id -u):$(id -g)"` so that `out/` stays yours.
Build trees go to `out/build/<preset>` in the checkout, as on the host; a preset
configured in the container and on a Linux host at once needs `--fresh` when you
switch, because the source path differs.

### Dev Container

`.devcontainer/devcontainer.json` builds the same image. In VS Code, install the
Dev Containers extension, open the repository and run **Dev Containers: Reopen in
Container**. The container comes with:

- CMake Tools, set to use the presets; it copies the active preset's
  `compile_commands.json` to the repository root;
- clangd, which reads that file, `.clang-format` and `.clang-tidy`;
- C/C++ (cpptools) for debugging with gdb, with its IntelliSense off in favor of
  clangd;
- cmake-format.

Outside VS Code, the [Dev Container CLI](https://github.com/devcontainers/cli) runs it:

```bash
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . cmake --workflow --preset linux-gcc-debug
```

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

## Formatting and static analysis

The repository root holds the configuration of three tools:

| File | Tool | Settings |
|------|------|----------|
| `.clang-format` | clang-format | Google style, C++20 |
| `.clang-tidy` | clang-tidy | bugprone, clang-analyzer, concurrency, misc, modernize, performance, portability and readability checks, without the ones that flag C arrays, magic numbers and short names |
| `.cmake-format.yaml` | cmake-format (cmakelang) | 80 columns, 2-space indent |

The recipe sources and the recipes' own `CMakeLists.txt` files keep the book's
formatting, so they match the printed listings; the formatters are applied to new
or changed code only:

```bash
clang-format -i <file>.cpp
cmake-format -i CMakeLists.txt Sources/CMakeLists.txt Sources/Chapter*/CMakeLists.txt cmake/toolchains/*.cmake
```

clang-tidy reads the compile commands of a configured preset:

```bash
clang-tidy -p out/build/linux-gcc-debug Sources/Chapter07/mutex/mutex.cpp
run-clang-tidy -p out/build/linux-gcc-debug -quiet Chapter07/   # every file matching the pattern
```
