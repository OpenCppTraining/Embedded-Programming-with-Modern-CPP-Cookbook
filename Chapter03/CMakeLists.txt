add_executable(alignment alignment/alignment.cpp)

# Clang rejects the pointer cast in a constexpr function by default before
# C++23, which GCC accepts.
add_executable(cache_align cache_align/cache_align.cpp)
target_compile_options(cache_align PRIVATE
  $<$<CXX_COMPILER_ID:Clang,AppleClang>:-Wno-invalid-constexpr>)

add_executable(sender enconv/sender.cpp)
add_executable(receiver enconv/receiver.cpp)

add_executable(endianness endiannes/endianness.cpp)

add_executable(fixed_types fixed_types/fixed_types.cpp)

add_executable(packed_alignment packed_alignment/packed_alignment.cpp)

add_executable(sizet sizet/sizet.cpp)
