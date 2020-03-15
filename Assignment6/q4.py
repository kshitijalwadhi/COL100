def lis(arr):
    n = len(arr)
    lis = [0] * n
    lis[0] = 1

    for i in range(1, n):
        for j in range(0, i):
            if (arr[i] > arr[j] and lis[i] < lis[j] + 1):
                lis[i] = lis[j]+1

    maximum = 0
    for i in range(0, n):
        maximum = max(maximum, lis[i])
    return maximum


arr = [1, 2, 9, 4, 7, 3, 11, 8, 14, 6]
print(lis(arr))
