add_executable(loop loop/loop.cpp)

add_executable(loop2 loop2/loop.cpp)
target_compile_definitions(loop2 PRIVATE $<$<CONFIG:Debug>:DEBUG>)

add_executable(loop3 loop3/loop.cpp)
target_compile_definitions(loop3 PRIVATE $<$<CONFIG:Debug>:DEBUG>)

# All three recipes build an executable called loop.
foreach(recipe loop loop2 loop3)
  set_target_properties(
    ${recipe} PROPERTIES OUTPUT_NAME loop RUNTIME_OUTPUT_DIRECTORY
                                          ${CMAKE_CURRENT_BINARY_DIR}/${recipe})
endforeach()
