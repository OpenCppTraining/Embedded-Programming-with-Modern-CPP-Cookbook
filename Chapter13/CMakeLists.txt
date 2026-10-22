add_executable(array array/array.cpp)
set_target_properties(array PROPERTIES CXX_STANDARD 17)

add_executable(expected expected/expected.cpp)
set_target_properties(expected PROPERTIES CXX_STANDARD 17)

# CPU affinity (cpu_set_t) is Linux-only.
if(LINUX)
  add_executable(pinthreads pinthreads/pinthreads.cpp)
  set_target_properties(pinthreads PROPERTIES CXX_STANDARD 14)
  target_link_libraries(pinthreads PRIVATE Threads::Threads)
endif()

add_executable(realtime realtime/realtime.cpp)
set_target_properties(realtime PROPERTIES CXX_STANDARD 14)
target_link_libraries(realtime PRIVATE Threads::Threads)
