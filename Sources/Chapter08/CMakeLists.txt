add_executable(ipc1 ipc1/ipc1.cpp)

add_executable(ipc2 ipc2/ipc2.cpp)

add_executable(stream stream/stream.cpp)

# POSIX message queues are Linux-only.
if(LINUX)
  add_executable(ipc3 ipc3/ipc3.cpp)
  target_link_libraries(ipc3 PRIVATE rt)

  add_executable(ipc4 ipc4/ipc4.cpp)
  target_link_libraries(ipc4 PRIVATE rt)

  find_path(FLATBUFFERS_INCLUDE_DIR flatbuffers/flatbuffers.h)
  find_library(FLATBUFFERS_LIBRARY flatbuffers)
  if(FLATBUFFERS_INCLUDE_DIR AND FLATBUFFERS_LIBRARY)
    add_executable(flat flat/ipc1.cpp)
    target_include_directories(flat PRIVATE ${FLATBUFFERS_INCLUDE_DIR})
    target_link_libraries(flat PRIVATE rt ${FLATBUFFERS_LIBRARY})
  else()
    message(STATUS "flatbuffers not found: skipping flat")
  endif()
endif()
