cmake_minimum_required(VERSION 3.22)
project(cpp_project_template VERSION 0.1.0)

# Project configuration settings
option(CPP_PROJECT_TEMPLATE_TEST "Enable unit-tests" OFF)

# Enable unit-testing
if(CPP_PROJECT_TEMPLATE_TEST)
  enable_testing()
  find_package(GTest CONFIG REQUIRED)
  include(GoogleTest)
endif()

add_subdirectory(src)
