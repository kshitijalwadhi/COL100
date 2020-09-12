import math


def integrate_midpoint(f, a, b, n):
    h = (b-a)/n
    x = a+h/2
    ans = 0.0
    for _ in range(n):
        ans += f(x)
        x += h

    return ans*h


def integrate_trapezoid(f, a, b, n):
    h = (b-a)/n
    x = a+h
    ans = (f(a) + f(b))/2
    for _ in range(n-1):
        ans += f(x)
        x += h

    return ans*h


def integrate_trapezoid_aliter(f, a, b, h):
    n = int((b-a)//h)
    x = a+h
    ans = (f(a) + f(b))/2
    for _ in range(n-1):
        ans += f(x)
        x += h

    return ans*h


def fun1(x):
    return x ** 2


def fun2(x):
    return math.sin(x)


# print(integrate_midpoint(fun1, 0, 3, 100))
# print(integrate_trapezoid(fun1, 0, 3, 100))

print(integrate_trapezoid_aliter(fun2, 0, 3.14, 0.1))
print(integrate_trapezoid_aliter(fun2, 0, 3.14, 0.01))
