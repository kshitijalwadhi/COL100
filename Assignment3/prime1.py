def find_div(n, test):
    if ((test*test) > n):
        return n
    elif ((n % test) == 0):
        return test
    else:
        return find_div(n, test+2)


def smallest_div(n):
    return find_div(n, 3)


def prime(n):
    if (n == 2):
        return True
    elif ((n % 2 == 1) and (n == smallest_div(n))):
        return True
    else:
        return False


num = input('Enter: ')
print(prime(int(num)))
