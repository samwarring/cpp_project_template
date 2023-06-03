# Usage: cmake [-DCLANG_FORMAT=<path>] -P clang_format.cmake

# Get path to project root
cmake_path(GET CMAKE_SCRIPT_MODE_FILE PARENT_PATH PROJECT_DIR)
cmake_path(GET PROJECT_DIR PARENT_PATH PROJECT_DIR)

# Determine which clang-format to use
if(CLANG_FORMAT)
  # Use the provided path
elseif(NOT "$ENV{CLANG_FORMAT}" STREQUAL "")
  # Use environment variable
  set(CLANG_FORMAT "$ENV{CLANG_FORMAT}")
else()
  # Assume 'clang-format' is found in PATH
  set(CLANG_FORMAT "clang-format")
endif()

message("---------------------------------------------------------------------")
message("project path: ${PROJECT_DIR}")
message("clang-format path: ${CLANG_FORMAT}")
execute_process(COMMAND "${CLANG_FORMAT}" --version)
message("---------------------------------------------------------------------")

file(GLOB_RECURSE SRC_FILES "${PROJECT_DIR}/src/*.cpp" "${PROJECT_DIR}/src/*.h"
     "${PROJECT_DIR}/src/*.hpp")
foreach(SRC_FILE IN LISTS SRC_FILES)
  message("${SRC_FILE}")
  # cmake-format: off
  execute_process(COMMAND "${CLANG_FORMAT}" -i "${SRC_FILE}"
                  COMMAND_ERROR_IS_FATAL ANY)
  # cmake-format: on
endforeach()
message("---------------------------------------------------------------------")
message("OK!")
