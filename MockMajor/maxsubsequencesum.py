def MaxSubSequenceSum(a, n):
    MaxSum = 0
    i = 0

    # INV: MaxSum >= sum[l..r] for all l in 0..i-1 and for all r such that l<=r<=n, 0<=i<=n

    while(i < n):
        ThisSum = 0
        j = i

        # INV: ThisSum = sum a[i...j-1] , i<=j<=n and
        # MaxSum >= sum[i...l] for all l in i...j-1

        while(j < n):
            ThisSum += a[j]
            if ThisSum > MaxSum:
                MaxSum = ThisSum
            j += 1
        i += 1

    # assert: MaxSum>= sum[l..r] for all l,r in 0..n-1, l<=r
    return MaxSum

# Time Complexity Analysis:
# For every value of i the inner loop is executed (n-i) times
# T(i=0) = n
# T(i=1) = n-1
# ...
# T(i=n) = 0
# T(n) = (n) + (n-1) + .. (0)
# T(n) = n*(n-1)/2
# Therefore time complexity is O(n^2)


def MaxSubSequenceSumImproved(a, n):
    MaxSum = 0
    MaxSumEndingHere = 0

    # INV: MaxSum >= sum[l..r] for all l,r in 0..i-1 with l<=r, 0<=i<=n
    #      MaxSumEndinghere >= sum[l..i-1] for all l in 0...i-1

    for i in range(0, n):
        MaxSumEndingHere = max(0, MaxSumEndingHere+a[i])
        MaxSum = max(MaxSum, MaxSumEndingHere)
        i += 1

    # assert: MaxSum>= sum[l..r] for all l,r in 0..n-1, l<=r
    return MaxSum


# Time Complexity Analysis:
# as i goes from 0 to n-1
# T(n) = T(n-1) + 1  <- This recursive relation is followed
# T(n) = n
# Therefore the time complexity is O(n)
