add_executable(async async/async.cpp)
target_link_libraries(async PRIVATE Threads::Threads)
target_link_options(async PRIVATE $<$<PLATFORM_ID:Linux>:-static-libstdc++>)

add_executable(atomic atomic/atomic.cpp)
target_link_libraries(atomic PRIVATE Threads::Threads)

add_executable(condvar condvar/condvar.cpp)
target_link_libraries(condvar PRIVATE Threads::Threads)

# Clang with libstdc++ calls __atomic_is_lock_free from libatomic.
add_executable(lockfree lockfree/lockfree.cpp)
target_link_libraries(
  lockfree
  PRIVATE Threads::Threads
          $<$<AND:$<PLATFORM_ID:Linux>,$<CXX_COMPILER_ID:Clang>>:atomic>)

add_executable(memorder memorder/memorder.cpp)
target_link_libraries(memorder PRIVATE Threads::Threads)

add_executable(mutex mutex/mutex.cpp)
target_link_libraries(mutex PRIVATE Threads::Threads)

add_executable(shmatomic shmatomic/shmatomic.cpp)
target_link_libraries(shmatomic PRIVATE Threads::Threads
                                        $<$<PLATFORM_ID:Linux>:rt>)

add_executable(threads threads/threads.cpp)
target_link_libraries(threads PRIVATE Threads::Threads)
