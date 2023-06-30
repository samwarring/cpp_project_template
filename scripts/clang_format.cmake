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
execute_process(COMMAND "${CLANG_FORMAT}" --version COMMAND_ERROR_IS_FATAL ANY)
file(GLOB_RECURSE SRC_FILES "${PROJECT_DIR}/*.cpp" "${PROJECT_DIR}/*.h"
     "${PROJECT_DIR}/*.hpp")
list(FILTER SRC_FILES EXCLUDE REGEX vcpkg/|build/)
list(LENGTH SRC_FILES SRC_FILES_LENGTH)
message("Formatting ${SRC_FILES_LENGTH} files...")
message("---------------------------------------------------------------------")

foreach(SRC_FILE IN LISTS SRC_FILES)
  message("${SRC_FILE}")
  execute_process(COMMAND "${CLANG_FORMAT}" -i "${SRC_FILE}"
                          COMMAND_ERROR_IS_FATAL ANY)
endforeach()
message("---------------------------------------------------------------------")
message("OK!")
