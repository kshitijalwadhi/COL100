# Honor Code

# I hereby confirm that I am the sole author of the work and that I've written all the solutions entirely on my own.
# I have not taken any help from online source nor have I discussed these solutions with anyone.

# Kshitij Alwadhi
# 2019EE30577
# Group 30


# IH: pascal(p,q) gives the qth number in pth row in the pascals triangle.

def pascal(p, q):
    initial = 1
    if(q == 0):
        return 1
    else:
        return pascal(p, q-1) * (p-q+1)/q


def pascal_iter(p, q):
    ans = 1
    for i in range(1, q+1):
        ans *= (p-i+1)/(i)
    return ans


# Basis: pascal(p,0) = 1 for all p>=0 integer
#        pascal(0,0) = pascal(1,0) = pascal(1,1) = 1
# IH: pascal(p,q) gives the qth number in pth row in the pascals triangle.

# IS: From pascals theorem, it follows that pascal(p,q) = pascal(p,q-1) * (p-q+1)/q
#     This is derived by using the fact that each (p,q) is equivalent to pCr. (proved below:)
#     pCr = (pCr-1) * (p-r+1)/r

# pascal(p+1,0) = 1 = p+1 C0
# From pascals tree,
# pascal(p+1,q) = pascal(p,q-1) + pascal(p,q)
# pascal(p+1,q) = pCr-1 + pCr (from IH)
# pascal(p+1,q) = p+1Cq  (From pascals law of combination)

# Analysis:
#   Time complexity Analysis:
#   For any given q, the algo runs from (p,q) to (p,0) recursively, i.e.
#   T(p,q) = T(p,q-1) +1
#   ...
#   T(p,1) = T(p,0) + 1
#   Since we know the value of pascal(p,0) =1,
#   T(p,q) = q
#   O(p,q) = q   <- Time complexity grows linearly with q

#   Space Analysis:
#   For the recursive one, the space complexity is O(q).  (Recursively new value stored everytime)
#   Whereas for the iterative one, the space complexity is O(1) as the same variable keeps getting updated.
