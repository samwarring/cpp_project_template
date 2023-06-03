#ifndef INCLUDED_PROJECT_LIB_MATH_HPP
#define INCLUDED_PROJECT_LIB_MATH_HPP

#include <complex>
#include <tuple>

namespace project_lib {

std::tuple<std::complex<double>, std::complex<double>>
quadratic(double a, double b, double c);

}

#endif