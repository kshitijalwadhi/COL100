# Honor Code

# I hereby confirm that I am the sole author of the work and that I've written all the solutions entirely on my own.
# I have discussed these solutions with anyone.
# These solutions are biased by my previous knowledge of Karatsuba Algorithm.

# Kshitij Alwadhi
# 2019EE30577
# Group 30


# a) When we are considering 4 multiplications, the recursive relation becomes:
#    T(n) = 4 * T(n/2) + O(n)
#    where we broke the multiplication in 4 sub parts (n/2 bits) and O(n) time for evaluating previous expression.
#    However, if we used the method given in the question to break into 3 parts,
#    The recursive relation will become:
#    T(n) = 3 * T(n/2) + O(n)
#    This constant factor reduction from 4 to 3 occurs at every level of recursion.
#    Hence, this compounding effect dramatically lowers the time complexity.

# b) This recursive tree has a height of log2 n  = k. (n = 2^k given )
#    We are getting 3 branches at every node so till a depth of p in the recursive tree,
#    We will have to solve 3^p sub problems each of size (n/2^p) with each subproblem requiring a linear time.
#    This can be written as :
#    Time taken till solving depth p of tree:
#    3^p * O(n/2^p) = (3/2)^p * O(n).
#    Now since the depth of the tree is k.
#    At the bottom, k = log2 n
#    The time taken can be written as O(3^log2 n) which by logarithmic properties, is equivalent to:
#    O(n^(log2 3))  = O(n^1.59)
#    Had this trick of reducing into 3 multiplications not been used, the time complexity would have been,
#    O(n^(log2 4))  = O(n^2)

# c) Code below:

# Giving Pseudo code due to lack of time:

"""

fun multiply(x, y) =
    if len(X) == 1 or len(Y) == 1
        return X*Y(Simple Multiply)

    else
        m = max(len(X), len(Y))
        m_by2 = m div 2

        a = x div(10 ^ m2)
        b = x % 10 ^ (m2)
        c = y div(10 ^ m2)
        d = y % 10 ^ (m2)

        z0 = multiply(b, d)
        z1 = multiply((a+b), (c+d))
        z2 = multiply(a, c)

        return (z2 * 10 ^ (2*m2)) + ((z1 - z2 - z0) * 10 ^ (m2)) + (z0)


"""
