def kth(arr, k):
    # assert: arr[1..n] is established with n>0 and 1<=k<=n
    l = 0
    u = len(arr)-1
    # INV: all elements in arr[1...l-1] <= all elements in arr[u+1....n] and l<= k+1 and k-1>=u
    while(l < u):
        i = l
        j = u
        x = arr[k-1]
        # INV: all elements in arr[l...i-1] <= all elements in arr[j+1...u] and i<=k-1 and j>=k-1
        while(i <= k-1 and j >= k-1):
            while (arr[i] < x):
                i += 1
            while (x < arr[j]):
                j -= 1
            arr[i], arr[j] = arr[j], arr[i]
            i += 1
            j -= 1
        if(j < k-1):
            l = i
        elif(i > k-1):
            u = j
    # assert: all elements of arr[1...k] <= all elements of arr[k...n]
    return arr[k-1]


arr = [75, 13, 6, 9, 69, 45]
print(kth(arr, 3))


# Time Complexity Analysis:

# Since this algorithm is very much dependent on the value of x we take it in the beginning,
# The time complexity also largely varies with it.
# Suppose when arr[k] is the kth smallest element itself,
# Then the program will complete in the first loop itself making n+1 comparisons.
# Making the best case Time complexity: O(n)
# Whereas when the problem space is decreased by 1 in every trial (much like the worst case scenario for quick sort)
# The worst case scenario Time complexity will be: O(n^2)


# Comments:

# This algorithm follows from the proof of Q2 and also the invariants
# show what is going on in every loop. In the previous question,
# we didn't know where the partition would be placed but we did know
# what element would be present about the partitioning index.
# Here we know the partitioning index (k) and we are required to find the
# element that is present at the partition.
