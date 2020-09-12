def f(x):
    return x**2 - 2


def fp(x):
    return 2*x


def newton(x0, f, fp, eps, n):
    guess = x0
    error = 'didnt converge'
    for _ in range(n):
        denom = fp(guess)
        if denom == 0:
            error = 'div by 0'
            break
        new_guess = guess - f(guess)/denom
        if(abs(guess-new_guess) < eps):
            return new_guess
        guess = new_guess
    print(error)
    return 0


print(newton(1, f, fp, 0.05, 10000))
