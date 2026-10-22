


# Embedded Programming with Modern C++ Cookbook
Embedded Programming with Modern C++ Cookbook by Packt Publishing

## Building

Every recipe still has its own `CMakeLists.txt` and builds on its own as described
in the book. The top-level `CMakeLists.txt` builds all of them at once, as C++20,
with CMake 3.25 or newer and Ninja.

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

Each preset comes in `debug`, `dev` (RelWithDebInfo) and `release` variants:

| Host  | Preset                  | Compiler                                       |
|-------|-------------------------|------------------------------------------------|
| Linux | `linux-gcc-*`           | `g++`                                          |
| Linux | `linux-clang-*`         | `clang++`                                      |
| Linux | `linux-arm-gnueabi-*`   | `arm-linux-gnueabi-g++` (ARM, soft-float)      |
| Linux | `linux-arm-gnueabihf-*` | `arm-linux-gnueabihf-g++` (ARM, hard-float)    |
| macOS | `macos-appleclang-*`    | `/usr/bin/clang++`                             |

The executables go to `out/build/<preset>/ChapterNN/`. The three `loop` recipes of
chapter 5 go to `out/build/<preset>/Chapter05/<recipe>/loop`.

On Debian or Ubuntu, the toolchains come from:

```bash
sudo apt install cmake ninja-build g++ clang g++-arm-linux-gnueabi g++-arm-linux-gnueabihf
```

Some recipes need a library, and are skipped with a message when it is not found:
`gpio` and `pwm` need wiringPi, `gpiod` needs the libgpiod 1.x C++ bindings, `usb`
needs libudev and `flat` needs FlatBuffers. The ARM presets look for these libraries
under `/usr/arm-linux-gnueabi` and `/usr/arm-linux-gnueabihf`. On macOS, the recipes
that use Linux-only interfaces are skipped as well. The recipes have no automated
tests, so the test step runs none.

Chapter 4 (8051, SDCC) and chapter 15 (Arduino) are built with their own tools, as
described in the book.

## Erratas

On page 62 "Create a file called CMakeLists.txt in the loop subdirectory" should read 
           "Create a file called CMakeLists.txt in the fixed_types subdirectory".

On page 65 "Create a file called CMakeLists.txt in the loop subdirectory" should read
           "Create a file called CMakeLists.txt in the sizet subdirectory".

On page 67 "Use your favorite text editor to create a file called loop.cpp in the loop subdirectory" should read
           "Use your favorite text editor to create a file called endianness.cpp in the endianness subdirectory".

On page 68 "Create a file called CMakeLists.txt in the loop subdirectory" should read
           "Create a file called CMakeLists.txt in the endianness subdirectory".

On page 72 "Create a file called CMakeLists.txt in the loop subdirectory" should read
           "Create a file called CMakeLists.txt in the enconv subdirectory".

On page 75 "Use your favorite text editor to create a file called alignment.cpp in the loop subdirectory" should read
           "Use your favorite text editor to create a file called alignment.cpp in the alignment subdirectory.".

On page 76 "Create a file called CMakeLists.txt in the loop subdirectory" should read
           "Create a file called CMakeLists.txt in the alignment subdirectory".

On page 82 "Create a file called CMakeLists.txt in the loop subdirectory" should read
           "Create a file called CMakeLists.txt in the cache_align subdirectory".

On page 139 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the prealloc subdirectory".

On page 142 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the objpool subdirectory".

On page 149 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the ringbuf subdirectory".

On page 156 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the shmem subdirectory".

On page 167 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the threads subdirectory".

On page 170 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the mutex subdirectory".

On page 174 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the condvar subdirectory".

On page 179 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the atomic subdirectory".

On page 183 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the memorder subdirectory".

On page 187 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the lockfree subdirectory".

On page 192 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the shmatomic subdirectory".

On page 197 "Create a file called CMakeLists.txt in the loop subdirectory" should read
            "Create a file called CMakeLists.txt in the async subdirectory".
### Download a free PDF

 <i>If you have already purchased a print or Kindle version of this book, you can get a DRM-free PDF version at no cost.<br>Simply click on the link to claim your free PDF.</i>
<p align="center"> <a href="https://packt.link/free-ebook/9781838821043">https://packt.link/free-ebook/9781838821043 </a> </p>