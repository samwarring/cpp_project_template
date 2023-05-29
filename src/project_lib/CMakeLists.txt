add_library(project_lib math.cpp)
target_include_directories(
  project_lib
  PUBLIC include/public
  PRIVATE include/private)
target_compile_features(project_lib PUBLIC cxx_std_17)
