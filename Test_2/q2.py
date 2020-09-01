def groupNumbers(arr):
    # assert: arr[1..n] of size N is establised

    N = len(arr)
    count1, count2, count3 = 0, 0, 0

    # INV: 0<=count1,count2,count3<=N and,
    # count1, count2, count3 contains the number of occurences of 1, 2, 3 respectively
    # when we have traversed the array till index p.

    for p in range(0, N):
        if(arr[p] == 1):
            count1 += 1
        elif(arr[p] == 2):
            count2 += 1
        else:
            count3 += 1
    # assert: count1, count2, count3 contains the number of occurences of 1, 2, 3 respectively in the array.

    finalArr = [1]*count1 + [2]*count2 + [3]*count3

    # assert: finalArr[1..n] has numbers of same type grouped together
    return finalArr


arr = [1, 3, 1, 1, 2, 3, 2]

newarr = groupNumbers(arr)
print(newarr)
