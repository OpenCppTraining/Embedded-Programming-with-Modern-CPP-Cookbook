# Installing

The build has no install rules: `cmake --install` installs nothing. The recipes
run from the build tree, or are copied to the board they are meant for.

## On the build machine

Run the executables from `out/build/<preset>/Sources/ChapterNN/`; see
[BUILDING.md](BUILDING.md#output).

## On an ARM board

1. Pick the presets that match the board's ABI: `linux-arm-gnueabihf-*` for a
   hard-float system, such as 32-bit Raspberry Pi OS, or `linux-arm-gnueabi-*` for
   a soft-float one. No preset targets 64-bit ARM.
2. Build:

   ```bash
   cmake --workflow --preset linux-arm-gnueabihf-release
   ```

3. Copy the executables you need to the board and run them there:

   ```bash
   scp out/build/linux-arm-gnueabihf-release/Sources/Chapter07/mutex <user>@<board>:
   ssh <user>@<board> ./mutex
   ```

### What the board needs

- The executables link dynamically against glibc, libgcc and libstdc++. The
  board's libstdc++ must be at least as new as the cross compiler's: executables
  from GCC 13 can need symbols up to `GLIBCXX_3.4.32`. If the board's is older,
  build with a cross compiler no newer than the board's GCC. `async` links libstdc++ statically, as
  in the book.
- `gpio` and `pwm` need wiringPi, `gpiod` libgpiod 1.x, `usb` libudev and `flat`
  FlatBuffers on the board as well.
