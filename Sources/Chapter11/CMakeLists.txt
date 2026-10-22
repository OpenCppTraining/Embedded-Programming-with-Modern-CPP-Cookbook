add_executable(chrono chrono/chrono.cpp)

add_executable(delays delays/delays.cpp)

add_executable(interval interval/interval.cpp)

add_executable(monotonic monotonic/monotonic.cpp)
target_link_libraries(monotonic PRIVATE Threads::Threads)

add_executable(timestamps timestamps/timestamps.cpp)
