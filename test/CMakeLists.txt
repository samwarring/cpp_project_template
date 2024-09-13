find_package(GTest CONFIG REQUIRED)
include(GoogleTest)

add_executable(mymath_test mymath_test.cpp)
target_link_libraries(mymath_test PRIVATE mymath::mymath GTest::gtest_main)
gtest_discover_tests(mymath_test)
