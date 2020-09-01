def partition(arr, x):
    # assert: arr[1..n] is established with n>0 and x is also established.
    n = len(arr)
    i = 0
    j = n-1
    while(i < j and arr[i] <= x):
        i += 1
    while(i < j and arr[j] > x):
        j -= 1
    # INV: after ith iteration, all elements in arr[1...i-1]<=x and arr[j+1...n]>x
    # and i<=n and j>=0 and i<=j+1
    while(i < j):
        arr[i], arr[j] = arr[j], arr[i]
        i = i+1
        j = j-1
        while(i < j and arr[i] <= x):
            i += 1
        while(i < j and arr[j] > x):
            j -= 1
    p = j
    return p
# assert: arr[1...p+1]<=x and arr[p+2...n]>x
# and p is the partitioning index


arr = [28, 26, 25, 11, 16, 12, 24, 29, 6, 10]
n = len(arr)
x = 17
p = partition(arr, x)

for i in range(0, n):
    print(arr[i], end=' ')
print()
print('Partitioning index is: ' + str(p+1))


# Time complexity analysis:

# Since we are transversing from both the ends,
# only N/2 comparisons are made.
# and since the increment is by +2 every time, we can say that the algorithm is linear.
# T(N) = T(N-2) +1  -> Recursive Relation
# T(N) = N/2
# From this we can get that the time complexity is O(N).


# Proof/Comments:

# When the first two while loops are executed,
# We reach two elements which are at the wrong sides of the partition that is required,
# The smaller element is on the right side and the larger element is on the left.
# Now while (i<j):
# We swap the two elements,
# after swapping, we increase the value of i by 1 and decrease j by 1.
# and another 2 loops are executed to find the next two wrongly placed elements
# Then the loop is executed again to swap the elements and so on.
# This goes on till i<j.
# In the end, we equate the partition with the iterator j.
