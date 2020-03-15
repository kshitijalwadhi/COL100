def removeduplicates(arr, n):
    if (n == 0 or n == 1):
        return n
    temp = list(range(n))
    temp[0] = arr[0]
    count = 1
    for i in range(1, n):
        if (arr[i] != arr[i-1]):
            temp[count] = arr[i]
            count += 1
    for i in range(count, n):
        temp[i] = 0
    for i in range(0, n):
        arr[i] = temp[i]
    return count


arr = [2, 2, 4, 8, 8, 23, 37, 37, 42]
n = len(arr)
newn = removeduplicates(arr, n)

for i in range(n):
    print(arr[i], end=' ')
print()
print("New length is: ", newn)
