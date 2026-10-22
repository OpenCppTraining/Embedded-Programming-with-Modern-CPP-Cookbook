# Packaging

There is no packaging yet: the build has no install rules and no CPack
configuration, so `cpack` produces nothing. The recipes are examples meant to be
built and run from the build tree, or copied to a board; see
[INSTALL.md](INSTALL.md).

Packaging would build on install rules: an `install(TARGETS ...)` per chapter,
then CPack (for example a `.tar.gz`, or a `.deb` for `armhf` from the
`linux-arm-gnueabihf-*` presets) and package presets in `CMakePresets.json`.
