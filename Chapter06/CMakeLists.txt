add_executable(objpool objpool/objpool.cpp)

add_executable(prealloc prealloc/prealloc.cpp)

add_executable(ringbuf ringbuf/ringbuf.cpp)

add_executable(shmem shmem/shmem.cpp)
target_link_libraries(shmem PRIVATE $<$<PLATFORM_ID:Linux>:rt>)

add_executable(timer timer/timer.cpp)
