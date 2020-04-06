# assert: for n>1, elements of arr[1...n] are in ascending order
def removeduplicates(arr, n):
    if (n == 0 or n == 1):
        return n
    temp = list(range(n))
    temp[0] = arr[0]
    count = 1
    for i in range(1, n):
        # INV: after the ith iteration (count<=i), temp[1...count] contains all unique elements in ascending order.
        if (arr[i] != arr[i-1]):
            temp[count] = arr[i]
            count += 1
    # comment: next loop for adding the 0's at the end of array for repeated elements
    for i in range(count, n):
        temp[i] = 0
    # assert: replacing arr with temp now
    for i in range(0, n):
        arr[i] = temp[i]
    return count
# assert: array elements arr[1...count] are unique and after that there are 0's
# and count is the number of unique elements in the original array.


# Code for input and output to test program

arr = [2, 2, 4, 8, 8, 23, 37, 37, 42]
n = len(arr)
newN = removeduplicates(arr, n)

for i in range(n):
    print(arr[i], end=' ')
print()
print("New length is: ", newN)


# Time Complexity Analysis:

# for i in range(1, n):
#     if (arr[i] != arr[i-1]):
#         temp[count] = arr[i]
#         count += 1

# This loop increments the value of i by 1 after each execution.
# So the complexity is linear.
# T(n) = T(n-1) + 1

# Therefore Time Complexity is: O(N)


# Proof/Comments:

# We are comparing adjacent elements in the first 'for' loop,
# when the a new element is found, we insert it into the new array (temp),
# whereas when an element which is being repeated is found,
# it gets skipped as theres an if condition which is comparing equality.
# This method is working here as the array we are given is sorted and
# the equal elements occur together.
# Also we are mainting a count of number of repeated elements,
# so that we can append 0's at the end.
