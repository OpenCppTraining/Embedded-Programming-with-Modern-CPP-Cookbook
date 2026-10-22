# These recipes set no standard; C++14 is the default of the GCC the book uses.

find_path(WIRINGPI_INCLUDE_DIR wiringPi.h)
find_library(WIRINGPI_LIBRARY wiringPi)
if(WIRINGPI_INCLUDE_DIR AND WIRINGPI_LIBRARY)
  add_executable(gpio gpio/gpio.cpp)
  add_executable(pwm pwm/pwm.cpp)
  set_target_properties(gpio pwm PROPERTIES CXX_STANDARD 14)
  target_include_directories(gpio PRIVATE ${WIRINGPI_INCLUDE_DIR})
  target_include_directories(pwm PRIVATE ${WIRINGPI_INCLUDE_DIR})
  target_link_libraries(gpio PRIVATE ${WIRINGPI_LIBRARY})
  target_link_libraries(pwm PRIVATE ${WIRINGPI_LIBRARY})
else()
  message(STATUS "wiringPi not found: skipping gpio and pwm")
endif()

# gpiod.cpp uses the libgpiod 1.x C++ API, which libgpiod 2 removed.
find_path(GPIODCXX_INCLUDE_DIR gpiod.hpp)
find_library(GPIODCXX_LIBRARY gpiodcxx)
if(GPIODCXX_INCLUDE_DIR AND GPIODCXX_LIBRARY)
  include(CheckCXXSourceCompiles)
  set(CMAKE_REQUIRED_INCLUDES ${GPIODCXX_INCLUDE_DIR})
  check_cxx_source_compiles([[
    #include <gpiod.hpp>
    int main() { return gpiod::line_request::DIRECTION_OUTPUT; }
  ]] GPIODCXX_HAS_V1_API)
  unset(CMAKE_REQUIRED_INCLUDES)
endif()
if(GPIODCXX_HAS_V1_API)
  add_executable(gpiod gpiod/gpiod.cpp)
  set_target_properties(gpiod PROPERTIES CXX_STANDARD 14)
  target_include_directories(gpiod PRIVATE ${GPIODCXX_INCLUDE_DIR})
  target_link_libraries(gpiod PRIVATE ${GPIODCXX_LIBRARY})
else()
  message(STATUS "libgpiod 1.x C++ bindings not found: skipping gpiod")
endif()

# Linux kernel headers.
if(LINUX)
  add_executable(i2c i2c/i2c.cpp)
  add_executable(rtc rtc/rtc.cpp)
  set_target_properties(i2c rtc PROPERTIES CXX_STANDARD 14)
endif()
