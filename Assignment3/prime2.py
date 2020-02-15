from random import seed
from random import randint
seed(1)


def expmod(b, e, m):
    if (e == 0):
        return 1
    elif (e % 2 == 0):
        return (expmod(b, e//2, m) * expmod(b, e//2, m)) % m
    else:
        return ((b % m) * expmod(b, e-1, m)) % m


def fermat(n):
    a = randint(2, n-1)
    if (a == expmod(a, n, n)):
        return True
    else:
        return False


def prime_actual(n, q, failtest):
    if (q == 0):
        return True
    elif (failtest == 1):
        return False
    else:
        return prime_actual(n, q-1, not(fermat(n)))


def prime(n, q):
    if (n == 2):
        return True
    else:
        return prime_actual(n, q, False)


num = input('Enter the number to be tested: ')
num2 = input('Enter q: ')
print(prime(int(num), int(num2)))
