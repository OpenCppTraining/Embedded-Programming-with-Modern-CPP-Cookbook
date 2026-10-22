add_executable(alignment alignment/alignment.cpp)

# The recipe sets no standard (CMAKE_CXX_FLAGSE typo); C++14 is the default of
# the GCC the book uses. Clang rejects the pointer cast in a constexpr function
# by default, which GCC accepts.
add_executable(cache_align cache_align/cache_align.cpp)
set_target_properties(cache_align PROPERTIES CXX_STANDARD 14)
target_compile_options(cache_align PRIVATE
  $<$<CXX_COMPILER_ID:Clang,AppleClang>:-Wno-invalid-constexpr>)

add_executable(sender enconv/sender.cpp)
add_executable(receiver enconv/receiver.cpp)
set_target_properties(sender receiver PROPERTIES CXX_STANDARD 14)

add_executable(endianness endiannes/endianness.cpp)

add_executable(fixed_types fixed_types/fixed_types.cpp)

add_executable(packed_alignment packed_alignment/packed_alignment.cpp)

add_executable(sizet sizet/sizet.cpp)
