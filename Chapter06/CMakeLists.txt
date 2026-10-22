add_executable(objpool objpool/objpool.cpp)

add_executable(prealloc prealloc/prealloc.cpp)
set_target_properties(prealloc PROPERTIES CXX_STANDARD 17)

add_executable(ringbuf ringbuf/ringbuf.cpp)

add_executable(shmem shmem/shmem.cpp)
set_target_properties(shmem PROPERTIES CXX_STANDARD 14)
target_link_libraries(shmem PRIVATE $<$<PLATFORM_ID:Linux>:rt>)

add_executable(timer timer/timer.cpp)
