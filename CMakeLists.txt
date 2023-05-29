cmake_minimum_required(VERSION 3.24)
project(cpp_project_template VERSION 0.1.0)

# Project configuration settings
option(CPP_PROJECT_TEMPLATE_TEST "Enable unit-tests" OFF)

# Enable unit-testing
if(CPP_PROJECT_TEMPLATE_TEST)
  enable_testing()
endif()

# Locate dependencies
if(CPP_PROJECT_TEMPLATE_TEST)
  find_package(Catch2 CONFIG REQUIRED)
  include(Catch)
endif()

add_subdirectory(src)
