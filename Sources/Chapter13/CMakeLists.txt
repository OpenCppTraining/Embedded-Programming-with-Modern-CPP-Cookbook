add_executable(array array/array.cpp)

add_executable(expected expected/expected.cpp)

# CPU affinity (cpu_set_t) is Linux-only.
if(LINUX)
  add_executable(pinthreads pinthreads/pinthreads.cpp)
  target_link_libraries(pinthreads PRIVATE Threads::Threads)
endif()

add_executable(realtime realtime/realtime.cpp)
target_link_libraries(realtime PRIVATE Threads::Threads)
