add_executable(project_test math_test.cpp)
target_link_libraries(project_test PRIVATE Catch2::Catch2WithMain project_lib)
catch_discover_tests(project_test)
