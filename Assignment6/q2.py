def partition(arr, x):
    n = len(arr)
    i = 0
    j = n-1
    while(i < j and arr[i] <= x):
        i += 1
    while(i < j and arr[j] > x):
        j -= 1
    if (arr[j] > x):
        j = j-1
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


arr = [28, 26, 25, 11, 16, 12, 24, 29, 6, 10]
n = len(arr)
x = 17
p = partition(arr, x)

for i in range(0, n):
    print(arr[i], end=' ')
