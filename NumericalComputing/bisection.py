import random


def f(x):
    return x**3 + 5 * (x**2) + 2*x - 4


def createInterval(a, b):
    if(a >= b):
        return (b, a)
    else:
        return (a, b)


def bisection(f, eps):
    a = random.randint(-10, 10)
    b = random.randint(-10, 10)

    while(f(a)*f(b) > 0):
        a = random.randint(-10, 10)
        b = random.randint(-10, 10)

    c = (a+b)/2

    if(f(a)*f(c) < 0):
        interval = createInterval(a, c)
    else:
        interval = createInterval(b, c)

    intervalLen = interval[1] - interval[0]

    while(intervalLen > eps):
        a = interval[0]
        b = interval[1]
        c = (a+b)/2

        if(f(a)*f(c) < 0):
            interval = createInterval(a, c)
        else:
            interval = createInterval(b, c)

        intervalLen = interval[1] - interval[0]

    return interval


print(bisection(f, 0.1))
