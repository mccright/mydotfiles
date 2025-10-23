#!/usr/bin/python3
#
# thank you Bruno Jennings
# https://importpython.com/guide-to-writing-pi-in-python/

def pi_arc():
    import math
    pi_arc_value = (math.atan(1) * 4)
    return pi_arc_value


def math_pi():
    import math
    pi_value = math.pi
    return pi_value

def math_pi_simple():
    import decimal
    # from decimal import *
    decimal.getcontext().prec = 34
    pi_simple_32 = decimal.Decimal(22) / decimal.Decimal(7)
    return round(pi_simple_32, 15)

def numpy_pi():
    import numpy as np
    pi_value = np.pi
    return pi_value


def scipy_pi():
    import scipy
    pi_value = scipy.constants.pi
    return pi_value


def leibnitz_pi(n):
    import math
    pi_value = 0.0
    for k in range(n):
        # pi_value += (1/(16**k)) * ((-1)**(2*k+1)) / (4*k+1)
        # pi_value += (-1/ 16**k) * ((-1)**(2*k+1)) / (4*k+1)
        # pi_value += (((-1) ** k) * ((-1) ** (2 * k + 1)) / (4 * k + 1))
        pi_value += (((-1) ** k) * (4 / (2 * k + 1)))
    return pi_value


def nilakantha_pi(reps):
    # Thank you wikihow authors
    # https://www.wikihow.com/Write-a-Python-Program-to-Calculate-Pi
    import decimal
    decimal.getcontext().prec = 20
    pi_value = decimal.Decimal(3.0)
    op = 1
    n = 2
    for n in range(2, 2*reps+1, 2):
        pi_value += 4/decimal.Decimal(n*(n+1)*(n+2)*op)
        op *= -1
    return pi_value


def chudnovsky_pi(n):
    # Thank you Deepak Keshari
    # https://stackoverflow.com/questions/45113790/calculating-pi-to-the-nth-digit
    from math import factorial
    from decimal import Decimal, getcontext
    getcontext().prec=1000
    t= Decimal(0)
    pi = Decimal(0)
    deno= Decimal(0)

    for k in range(n):
        t = ((-1)**k)*(factorial(6*k))*(13591409+545140134*k)
        deno = factorial(3*k)*(factorial(k)**3)*(640320**(3*k))
        pi += Decimal(t)/Decimal(deno)
    pi = pi * Decimal(12) / Decimal(640320 ** Decimal(1.5))
    pi = 1/pi
    return round(pi,n)


def add_dot(num_string: str) -> str:
    # New function to add dot back in (McCright, 2025-10-22)
    new_string = num_string[:1] + '.' + num_string[1:]
    return str(new_string)


def sqrt(n, one):
    """
    Return the square root of n as a fixed point number with the one
    passed in.  It uses a second order Newton-Raphson convgence.  This
    doubles the number of significant figures on each iteration.
    See: http://www.craig-wood.com/nick/articles/pi-chudnovsky/ for more info
    and: https://www.craig-wood.com/nick/articles/pi-chudnovsky/pi_chudnovsky_bs.py
    """
    import math
    # Use floating point arithmetic to make an initial guess
    floating_point_precision = 10**16
    n_float = float((n * floating_point_precision) // one) / floating_point_precision
    x = (int(floating_point_precision * math.sqrt(n_float)) * one) // floating_point_precision
    n_one = n * one
    while 1:
        x_old = x
        x = (x + n_one // x) // 2
        if x == x_old:
            break
    return x


def pi_chudnovsky_bs(digits):
    """
    Python3 program to calculate Pi using python long integers, binary
    splitting and the Chudnovsky algorithm
    
    See: http://www.craig-wood.com/nick/articles/pi-chudnovsky/ for more info
    and: https://www.craig-wood.com/nick/articles/pi-chudnovsky/pi_chudnovsky_bs.py
    Nick Craig-Wood <nick@craig-wood.com>
	Very minor changes/additions by Matt McCright, 2025-10-22, commented in-line.
    """
    import math
    from time import time

    C = 640320
    C3_OVER_24 = C**3 // 24
    def bs(a, b):
        """
        Computes the terms for binary splitting the Chudnovsky infinite series

        a(a) = +/- (13591409 + 545140134*a)
        p(a) = (6*a-5)*(2*a-1)*(6*a-1)
        b(a) = 1
        q(a) = a*a*a*C3_OVER_24

        returns P(a,b), Q(a,b) and T(a,b)
        """
        if b - a == 1:
            # Directly compute P(a,a+1), Q(a,a+1) and T(a,a+1)
            if a == 0:
                Pab = Qab = 1
            else:
                Pab = (6*a-5)*(2*a-1)*(6*a-1)
                Qab = a*a*a*C3_OVER_24
            Tab = Pab * (13591409 + 545140134*a) # a(a) * p(a)
            if a & 1:
                Tab = -Tab
        else:
            # Recursively compute P(a,b), Q(a,b) and T(a,b)
            # m is the midpoint of a and b
            m = (a + b) // 2
            # Recursively calculate P(a,m), Q(a,m) and T(a,m)
            Pam, Qam, Tam = bs(a, m)
            # Recursively calculate P(m,b), Q(m,b) and T(m,b)
            Pmb, Qmb, Tmb = bs(m, b)
            # Now combine
            Pab = Pam * Pmb
            Qab = Qam * Qmb
            Tab = Qmb * Tam + Pam * Tmb
        return Pab, Qab, Tab
    # how many terms to compute
    DIGITS_PER_TERM = math.log10(C3_OVER_24/6/2/6)
    N = int(digits/DIGITS_PER_TERM + 1)
    # Calclate P(0,N) and Q(0,N)
    P, Q, T = bs(0, N)
    one = 10**digits
    sqrtC = sqrt(10005*one, one)
    # Added the dot back in (McCright, 2025-10-22)
    final_pi = (Q*426880*sqrtC) // T
    final_pi = add_dot(str(final_pi))
    return final_pi


def scipy_constants():
    import scipy
    res = dir(scipy.constants)
    print(res, end='\n')


if __name__ == '__main__':
    print(f"Scale:               .12345678901234567890123456789012")
    print(f"math.pi:            {str(math_pi())}")
    print(f"math simple calc:   {str(math_pi_simple())}")
    print(f"arctangent formula: {str(pi_arc())}")
    print(f"numpy.pi:           {str(numpy_pi())}")
    print(f"scipy.pi:           {str(scipy_pi())}")
    pi_num = chudnovsky_pi(32)
    print(f"Chudnovsky calc pi: {str(pi_num)}")
    pi_num = pi_chudnovsky_bs(32)
    print(f"Chudnovsky bs calc: {str(pi_num)}")
    pi_num = nilakantha_pi(1500000)
    print(f"Nilakantha calc pi: {str(pi_num)} (1.5M reps)")
    pi_num = leibnitz_pi(3500000)
    print(f"Leibnitz calc pi:   {str(pi_num)} (3.5M reps)")
    # print(f"- - - - - - - - - - - - -")
    # scipy_constants()
