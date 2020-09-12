# Honor Code

# I hereby confirm that I am the sole author of the work and that I've written all the solutions entirely on my own.
# I have not taken any help from online source nor have I discussed these solutions with anyone.

# Kshitij Alwadhi
# 2019EE30577
# Group 30


import math


def matMul(A, B):
    # assert: A and B are two matrices represented in linear form. (establised)
    # A = [a11,a21,a31....an1,an2...ann] and similarly for B

    n = int(math.sqrt(len(A)))

    C = [0 for i in range(len(A))]

    # INV: After i iterations of the first loop, i rows of C are filled
    # i.e. cx1, cx2...cxn for all x<=i
    for i in range(0, n):
        # INV: After j iteration of second loop, jth row of C is filled
        # i.e. ci1, ci2...cpj
        for j in range(0, n**2, n):
            # INV: For matrix Cij = summation{k from 1 to n}(aik * bkj) is obtained
            for k in range(0, n):
                C[i+j] += A[i+n*k] * B[j+k]

    # assert: C is the matrix multiplication of A and B also represented in linear form like A and B.
    # C = [c11,c21,c31....cn1,cn2...cnn]
    return C


# A = [1, 3, 2, 4]
# B = [2, 1, 3, 4]

# print(matMul(A, B))

# Analysis:

# Time Complexity analysis:
# The three for loops are nested.
# Each for loop is run n times.
# For the second loop
# T(n^2) = T(n^2 - n) + 1
# This recursive relation is followed.
# Therefore time complexity is O(n^3)
# where n is the size (nxn) of matrix

# Space Complexity analysis:
# An additional array C is used if the size (n*n)
# So space complexity is O(n^2) where n is (nxn in size of matrix) i.e. number of rows
