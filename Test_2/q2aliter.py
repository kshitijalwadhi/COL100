def groupNumbers(arr):
    # assert: arr[1..n] of size N is establised having elements as 1, 2, 3 only

    N = len(arr)

    cur_ini = 0
    cur_end = N-1
    i = 0

    # INV: In every iteration,
    # if the element is equal to 1, it is pushed/swapped to the left side of the array(position maintained by cur_ini)
    # if the element is equal to 3, it is pushed/swapped to the right side of the array(position maintained by cur_end)
    # if the element is equal to 2, it is kept as it is.

    while i <= cur_end:
        if(arr[i] == 1):
            arr[i], arr[cur_ini] = arr[cur_ini], arr[i]
            cur_ini += 1
            i += 1
        elif(arr[i] == 3):
            arr[i], arr[cur_end] = arr[cur_end], arr[i]
            cur_end -= 1
        else:
            i += 1

    # assert: arr[1..n] has numbers of same type grouped together
    return arr


# arr = [1, 3, 1, 1, 2, 3, 2, 1, 1, 3, 2]

# newarr = groupNumbers(arr)
# print(newarr)
