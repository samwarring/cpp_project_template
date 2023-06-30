#ifndef INCLUDED_MYMATH_HPP
#define INCLUDED_MYMATH_HPP

#include <complex>
#include <tuple>

namespace mymath {

/**
 * Computes roots of quadratic equation.
 * 
 * This function assumes the standard form of a quadratic equation:
 * \f$Ax^2+Bx+C=0\f$
 */
std::tuple<std::complex<double>, std::complex<double>>
quadratic(double a, double b, double c);

}

#endif