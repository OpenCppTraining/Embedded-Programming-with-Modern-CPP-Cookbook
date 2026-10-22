add_executable(catch catch/catch.cpp)

add_executable(debounce debounce/debounce.cpp)
set_target_properties(debounce PROPERTIES CXX_STANDARD 14)

add_executable(errcode errcode/errcode.cpp)

add_executable(except except/except.cpp)

add_executable(heartbeat heartbeat/heartbeat.cpp)
set_target_properties(heartbeat PROPERTIES CXX_STANDARD 14)

add_executable(static static/static.cpp)

add_executable(watchdog watchdog/watchdog.cpp)
set_target_properties(watchdog PROPERTIES CXX_STANDARD 14)
