cmake_minimum_required(VERSION 3.22)
project(mymath VERSION 0.1.0)
option(${PROJECT_NAME}_ENABLE_TEST "Enable unit-tests" OFF)

# Define target for header-only library.
add_library(mymath INTERFACE)
add_library(mymath::mymath ALIAS mymath)
target_include_directories(
  mymath INTERFACE "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
                   "$<INSTALL_INTERFACE:include>")
target_compile_features(mymath INTERFACE cxx_std_20)

# Add tests.
if(${PROJECT_NAME}_ENABLE_TEST)
  enable_testing()
  add_subdirectory(test)
endif()

add_subdirectory(pkg)
