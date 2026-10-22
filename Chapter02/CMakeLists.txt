# The recipe sets no standard; C++14 is the default of the GCC the book uses.
add_executable(hello hello/hello.cpp)
set_target_properties(hello PROPERTIES CXX_STANDARD 14)
