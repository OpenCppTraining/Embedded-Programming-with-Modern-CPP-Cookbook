cmake_minimum_required(VERSION 3.25)
project(EmbeddedProgrammingCookbook LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

enable_testing()

find_package(Threads REQUIRED)

add_subdirectory(Sources)
