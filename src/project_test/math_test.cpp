#include <catch2/catch_test_macros.hpp>
#include <project_lib/math.hpp>

SCENARIO("Can solve quadratic formula") {
  GIVEN("A quadratic equation with real roots") {
    double a = 1, b = 0, c = -1;

    WHEN("The roots are solved") {
      auto [r1, r2] = project_lib::quadratic(a, b, c);
      CAPTURE(r1, r2);

      THEN("Their values are 1 and -1") {
        auto lesser = r1.real() < r2.real() ? r1 : r2;
        auto greater = r1.real() < r2.real() ? r2 : r1;
        REQUIRE(lesser == -1.0);
        REQUIRE(greater == 1.0);
      }
    }
  }
  GIVEN("A quadratic equation with one real root with multiplicity 2") {
    double a = 1, b = 0, c = 0;

    WHEN("The roots are solved") {
      auto [r1, r2] = project_lib::quadratic(a, b, c);
      CAPTURE(r1, r2);

      THEN("Both roots are the expected value") {
        REQUIRE(r1 == 0.0);
        REQUIRE(r2 == 0.0);
      }
    }
  }
  GIVEN("A quadratic equation with no real roots") {
    double a = 1, b = 0, c = 1;

    WHEN("The roots are solved") {
      auto [r1, r2] = project_lib::quadratic(a, b, c);
      CAPTURE(r1, r2);

      THEN("Both roots are imaginary") {
        REQUIRE(r1.imag() != 0.0);
        REQUIRE(r2.imag() != 0.0);
      }
    }
  }
}