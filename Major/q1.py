# Honor Code

# I hereby confirm that I am the sole author of the work and that I've written all the solutions entirely on my own.
# I have not taken any help from online source nor have I discussed these solutions with anyone.

# Kshitij Alwadhi
# 2019EE30577
# Group 30


import math


def linTomultiple(A):
    n = int(math.sqrt(len(A)))
    ans = [[0 for i in range(n)] for j in range(n)]

    i = 0

    for p in range(n):
        for q in range(n):
            ans[q][p] = A[i]
            i += 1
            q += 1
        p += 1

    return ans


def multipleToLin(A):
    n = len(A)

    ans = [0 for i in range(n**2)]

    i = 0

    for p in range(n):
        for q in range(n):
            ans[i] = A[q][p]
            i += 1
            q += 1
        p += 1

    return ans


def matMul(A, B):

    n = int(math.sqrt(len(A)))

    ans = [[0 for i in range(n)] for j in range(n)]

    A = linTomultiple(A)
    B = linTomultiple(B)

    for i in range(len(A)):
        for j in range(len(B[0])):
            for k in range(len(B)):
                ans[i][j] += A[i][k] * B[k][j]

    C = multipleToLin(ans)

    return C


A = [1, 3, 2, 4]
B = [2, 1, 3, 4]

print(matMul(A, B))
