# assert: n>0
def lis(arr):
    n = len(arr)
    max_end = 0
    maxlength = 1
    length = [0]*(n)
    # INV: after ith iteration, length[1...i] contains lengths of lis ending at
    # a[1...i] and 1<=i<=n and max_length = length of maximum lis till ith index
    # and max_end contains the postition where it ends
    for i in range(1, n):
        check = arr[i]
        if check < arr[max_end]:
            max_j = 1
            for j in range(1, i-1):
                if arr[j] < check:
                    if max_j < length[j]:
                        max_j = length[j]
            length[i] = max_j+1
            if length[i] > maxlength:
                maxlength += 1
                max_end = i
        else:
            maxlength += 1
            length[i] = maxlength
            max_end = i
    return maxlength


arr = [1, 2, 9, 4, 7, 3, 11, 8, 14, 6]
print(lis(arr))
