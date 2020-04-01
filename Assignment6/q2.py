# assert: n>0
def partition(arr, x):
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
        temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
        i = i+1
        j = j-1
        while(i < j and arr[i] <= x):
            i += 1
        while(i < j and arr[j] > x):
            j -= 1
    p = j
    return p
# assert: arr[1...i-1]<=x and arr[j+1...n]>x and i>j
# and p is the partitioning index


arr = [3, 1, 6]
n = len(arr)
x = 6
p = partition(arr, x)

for i in range(0, n):
    print(arr[i], end=' ')
print('\n')
print('Partitioning index is: ' + str(p+1))


# Time complexity analysis:

# Since we are transversing from both the ends,
# only N/2 comparisons are made.
# and since the increment is by +2 every time, we can say that the algorithm is linear.
# T(N) = T(N-2) +1  -> Recursive Relation
# T(N) = N/2
# From this we can get that the time complexity is O(N).
