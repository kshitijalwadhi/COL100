import numpy as np


def mergesort(arr):
    # assert: arr[0...n-1] is established

    # assert: if only one element then array is already sorted
    if(len(arr) == 1):
        return arr

    mid = len(arr) // 2
    arr1 = arr[:mid]
    arr2 = arr[mid:]

    # comment: recursively sorting both the partitions of the array
    arr1 = mergesort(arr1)
    arr2 = mergesort(arr2)

    return merge(arr1, arr2)

    # assert: arr[0...n-1] is sorted
    return arr


def merge(arr1, arr2):
    # assert: arr1[0..n1-1] and arr2[0..n2-1] are establised
    # and arr1 and arr2 are sorted

    mergedArr = []
    i, j, k = 0, 0, 0
    n1, n2 = len(arr1), len(arr2)

    # INV: (0<=i<n1+n2) and (mergedArr[0..i] is sorted)
    while(i < n1+n2):

        if(j < n1 and k < n2):
            if(arr1[j] < arr2[k]):
                mergedArr.append(arr1[j])
                j += 1
            else:
                mergedArr.append(arr2[k])
                k += 1
        elif (j < n1):
            mergedArr.append(arr1[j])
            j += 1
        else:
            mergedArr.append(arr2[k])
            k += 1

        i += 1

    # assert: mergedArr[0..n1+n2-1] is sorted and has the elements from arr1 and arr2
    return mergedArr


N = 10
a = np.random.randint(0, N, N)
print(a)
sortedArr = mergesort(a)
print(*sortedArr)
