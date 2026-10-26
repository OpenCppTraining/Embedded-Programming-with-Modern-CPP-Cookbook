


# Embedded Programming with Modern C++ Cookbook
Embedded Programming with Modern C++ Cookbook by Packt Publishing

## Contents

| Path | What it holds |
|------|---------------|
| `Sources/ChapterNN/<recipe>/` | The recipes, each with the book's own `CMakeLists.txt` |
| `CMakeLists.txt`, `CMakePresets.json` | A build of all recipes at once, as C++20 |
| `cmake/toolchains/` | ARM cross-compiling toolchain files |
| `Dockerfile`, `.devcontainer/` | Linux build environment for Docker and Dev Containers |
| `Documentation/Technical/` | Technical documentation |

## Documentation

- [Architecture](Documentation/Technical/ARCHITECTURE.md): repository layout, the recipes, and how the builds are organized
- [Building](Documentation/Technical/BUILDING.md): prerequisites, build commands, Docker and Dev Containers
- [Testing](Documentation/Technical/TESTING.md): tests, and running the recipes
- [Installing](Documentation/Technical/INSTALL.md): running the recipes on an ARM board
- [Packaging](Documentation/Technical/PACKAGE.md)

## Quick start

```bash
cmake --list-presets
cmake --workflow --preset linux-gcc-debug
```

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