# Build environment for the Linux and ARM presets in CMakePresets.json, also
# used by the Dev Container.
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      clang \
      clang-format \
      clang-tidy \
      clangd \
      cmake \
      cmake-format \
      g++ \
      g++-arm-linux-gnueabi \
      g++-arm-linux-gnueabihf \
      gdb \
      gdb-multiarch \
      git \
      libflatbuffers-dev \
      libgpiod-dev \
      libudev-dev \
      ninja-build \
      qemu-user \
 && rm -rf /var/lib/apt/lists/*

USER ubuntu
WORKDIR /workspace
