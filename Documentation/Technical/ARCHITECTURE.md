# Architecture

The repository holds the recipes of the book, and two ways to build them: each
recipe's own build, as printed in the book, and a top-level build of all recipes.

## Repository layout

```text
.
├── CMakeLists.txt              top-level build
├── CMakePresets.json           configure, build, test and workflow presets
├── cmake/toolchains/           ARM cross-compiling toolchain files
├── Documentation/Technical/    this documentation
└── Sources/
    ├── CMakeLists.txt          adds every chapter to the top-level build
    └── ChapterNN/
        ├── CMakeLists.txt      the chapter's targets in the top-level build
        └── <recipe>/
            ├── CMakeLists.txt  the book's standalone build of the recipe
            └── *.cpp
```

## Recipes

| Chapter | Recipes (executable, where it differs) |
|---------|----------------------------------------|
| 02 | `hello` |
| 03 | `alignment`, `cache_align`, `enconv` (`sender`, `receiver`), `endiannes` (`endianness`), `fixed_types`, `packed_alignment`, `sizet` |
| 04 | `isr`, `serial`: 8051 C for SDCC, not built by CMake |
| 05 | `loop`, `loop2`, `loop3` (all three build an executable called `loop`) |
| 06 | `objpool`, `prealloc`, `ringbuf`, `shmem`, `timer` |
| 07 | `async`, `atomic`, `condvar`, `lockfree`, `memorder`, `mutex`, `shmatomic`, `threads` |
| 08 | `flat`, `ipc1`, `ipc2`, `ipc3`, `ipc4`, `stream` |
| 09 | `gpio`, `gpiod`, `i2c`, `pwm`, `rtc` |
| 10 | `udev` (`usb`) |
| 11 | `chrono`, `delays`, `interval`, `monotonic`, `timestamps` |
| 12 | `catch`, `debounce`, `errcode`, `except`, `heartbeat`, `static`, `watchdog` |
| 13 | `array`, `expected`, `pinthreads`, `realtime` |
| 14 | `assert`, `returns` |
| 15 | `snippet.cpp`: an Arduino sketch, not built by CMake |

## The per-recipe builds

Every recipe directory is a CMake project of its own, as the book prints it, and
is left as it is. Each one sets its standard (C++11, C++14 or C++17) through
`CMAKE_CXX_FLAGS`. Most of them also set `CMAKE_CXX_COMPILER` to
`/usr/bin/arm-linux-gnueabi-g++` (`realtime`: `arm-linux-gnueabihf-g++`) after
`project()`, so they build only where that compiler is installed at that path.

## The top-level build

`CMakeLists.txt` adds `Sources/`, which adds one directory per chapter. Each
`Sources/ChapterNN/CMakeLists.txt` defines the targets of that chapter's recipes;
the recipes' own `CMakeLists.txt` files are not used.

- One executable target per recipe executable, with the book's names. The three
  `loop` recipes are the targets `loop`, `loop2` and `loop3`, each with the output
  name `loop` in its own directory.
- Every target builds as C++20 without compiler extensions, set once in the
  top-level `CMakeLists.txt`.
- Every setting belongs to a target: no directory-wide flags, definitions or
  include paths.
- `enable_testing()` is on, but no tests are registered yet; see
  [TESTING.md](TESTING.md).

### Per-target settings

| Targets | Setting | Why |
|---------|---------|-----|
| `async`, `atomic`, `condvar`, `lockfree`, `memorder`, `mutex`, `shmatomic`, `threads`, `monotonic`, `pinthreads`, `realtime` | `Threads::Threads` | The book links them with `pthread` |
| `shmem`, `shmatomic`, `ipc3`, `ipc4`, `flat` | `rt` on Linux | The book links them with `rt` |
| `async` | `-static-libstdc++` on Linux | As in the book |
| `loop2`, `loop3` | `DEBUG` in Debug builds | As in the book |
| `cache_align` | `-Wno-invalid-constexpr` with Clang | Clang rejects its constexpr pointer cast before C++23; GCC accepts it |
| `lockfree` | `atomic` with Clang on Linux | Clang with libstdc++ calls `__atomic_is_lock_free` from libatomic |

### Platform and library checks

Some recipes need Linux, or a library that is not always installed. The build
skips them, with a message at configure time, instead of failing:

| Targets | Built when |
|---------|------------|
| `ipc3`, `ipc4` | Building for Linux (POSIX message queues) |
| `flat` | Building for Linux and FlatBuffers is found |
| `i2c`, `rtc` | Building for Linux (Linux kernel headers) |
| `pinthreads` | Building for Linux (`cpu_set_t`) |
| `gpio`, `pwm` | wiringPi is found |
| `gpiod` | The libgpiod 1.x C++ bindings are found; libgpiod 2 removed the API it uses |
| `usb` | libudev is found |

## Presets

`CMakePresets.json` names presets `<os>-<toolchain>-<config>`, with the configs
`debug` (Debug), `dev` (RelWithDebInfo) and `release` (Release). Hidden presets
keep each setting in one place:

```text
conf-common                          Ninja, out/build/<preset>, compile_commands.json
└─ conf-<os>-common                  only on that host OS (Linux, Darwin)
   └─ conf-<os>-<toolchain>-common   compiler, or toolchain file for ARM
      └─ <os>-<toolchain>-<config>   CMAKE_BUILD_TYPE
build-<preset>, test-<preset>        one each per configure preset
<preset> (workflow)                  configure, build and test in one command
```

Because of the host conditions, `cmake --list-presets` shows only the presets
that can run on the current machine.

## Cross-compiling

The `linux-arm-gnueabi-*` and `linux-arm-gnueabihf-*` presets use the toolchain
files in `cmake/toolchains/`. Each one sets the target system (Linux on ARM), the
cross compiler, and limits library and header lookups to
`/usr/arm-linux-gnueabi` or `/usr/arm-linux-gnueabihf`, where the Debian and
Ubuntu cross compiler packages install the target's C and C++ runtime. Libraries
installed elsewhere are not found, so the recipes that need them are skipped in
ARM builds.
