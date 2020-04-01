# assert: n>0
def lis(arr):
    n = len(arr)
    lis = [0] * n
    lis[0] = 1
    # INV: after ith iteration, lis[0..i] are lengths of longest increasing subsequences
    # ending at arr[0...i] and 0<=i<=n-1
    for i in range(1, n):
        # INV: after jth iteration, lis[i] will contain the length of the longest increasing subsequence
        # ending at ith index when we took the just previous element from arr[0...j]
        for j in range(0, i):
            if (arr[i] > arr[j] and lis[i] < lis[j] + 1):
                lis[i] = lis[j]+1
    # assert: the array lis[0..k..n-1] contains the lengths of longest increasing subsequences
    # with kth index containing the length of lis ending at kth index.
    maximum = 0
    for i in range(0, n):
        maximum = max(maximum, lis[i])
    return maximum
# assert: maximum = length of maximal increasing subsequence in arr[1...n]


arr = [1, 2, 9, 4, 7, 3, 11, 8, 14, 6]
print(lis(arr))


# TIME COMPLEXITY ANALYSIS:

# In the worst case when sequence is in descending order:
# n*(n-1)/2 steps will be executed.
# whereas in the best case scenario when the sequence is in ascending order:
# n steps will be executed.
# Therefore the time complexity will be between the two.

# So we can safely assume that in the worst case scenario,
# The time Complexity will be O(n^2)
