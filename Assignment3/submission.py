# KSHITIJ ALWADHI 2019EE30577

from random import randint
from random import seed

# First Primality test code starts

###############################################


def find_div(n, test):
    if ((test*test) > n):
        return n
    elif ((n % test) == 0):
        return test
    else:
        return find_div(n, test+2)


def smallest_div(n):
    return find_div(n, 3)


def prime1(n):
    if (n == 2):
        return True
    elif ((n % 2 == 1) and (n == smallest_div(n))):
        return True
    else:
        return False


print('First Primality test.')
num = input('Enter the number: ')
print(prime1(int(num)))

# First Primality Test Code ends

###########################################

# Second Primality Test Code starts

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


def prime2(n, q):
    if (n == 2):
        return True
    else:
        return prime_actual(n, q, False)


print('Second Primality Test')
num = input('Enter the number to be tested: ')
num2 = input('Enter q: ')
print(prime2(int(num), int(num2)))

# Second Primality Test Code ends

#####################################################
