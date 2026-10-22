# Testing

There are no automated tests yet. The recipes are demonstration programs: many of
them run until interrupted, and the ones that drive peripherals need the hardware
(chapter 9, `usb` in chapter 10, and `timer` in chapter 6, which maps `/dev/mem`).

`ctest --preset test-<preset>`, and the test step of `cmake --workflow`, run no
tests: they print `No tests were found!!!` and succeed.

## Running recipes by hand

Native builds run in place:

```bash
out/build/linux-gcc-debug/Sources/Chapter03/sizet
```

ARM builds run on a Linux host under QEMU user-mode emulation (`sudo apt install
qemu-user` on Debian or Ubuntu), with `-L` pointing at the ARM runtime installed
by the cross compiler packages:

```bash
qemu-arm -L /usr/arm-linux-gnueabihf out/build/linux-arm-gnueabihf-debug/Sources/Chapter02/hello
qemu-arm -L /usr/arm-linux-gnueabi out/build/linux-arm-gnueabi-debug/Sources/Chapter02/hello
```

## Adding tests

`enable_testing()` is already called by the top-level `CMakeLists.txt`. Register a
test next to its target in `Sources/ChapterNN/CMakeLists.txt`, for a recipe that
exits on its own:

```cmake
add_test(NAME sizet COMMAND sizet)
```

For the ARM presets to run such tests on the host, the toolchain files would also
need `CMAKE_CROSSCOMPILING_EMULATOR`, for example `qemu-arm` with its `-L` option.
