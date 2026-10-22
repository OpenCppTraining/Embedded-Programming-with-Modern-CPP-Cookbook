add_executable(chrono chrono/chrono.cpp)
set_target_properties(chrono PROPERTIES CXX_STANDARD 14)

# delays.cpp declares a function with an auto parameter, a C++20 feature that
# GCC accepts in C++14 as an extension and Clang rejects.
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  add_executable(delays delays/delays.cpp)
  set_target_properties(delays PROPERTIES CXX_STANDARD 14)
else()
  message(STATUS "delays needs GCC below C++20: skipping it")
endif()

add_executable(interval interval/interval.cpp)

add_executable(monotonic monotonic/monotonic.cpp)
target_link_libraries(monotonic PRIVATE Threads::Threads)

add_executable(timestamps timestamps/timestamps.cpp)
