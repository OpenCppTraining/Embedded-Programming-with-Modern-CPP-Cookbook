cmake_minimum_required(VERSION 3.25)
project(EmbeddedProgrammingCookbook LANGUAGES CXX)

# Recipes that the book builds with another standard override CXX_STANDARD
# on their own target.
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

enable_testing()

find_package(Threads REQUIRED)

add_subdirectory(Chapter02)
add_subdirectory(Chapter03)
add_subdirectory(Chapter05)
add_subdirectory(Chapter06)
add_subdirectory(Chapter07)
add_subdirectory(Chapter08)
add_subdirectory(Chapter09)
add_subdirectory(Chapter10)
add_subdirectory(Chapter11)
add_subdirectory(Chapter12)
add_subdirectory(Chapter13)
add_subdirectory(Chapter14)
