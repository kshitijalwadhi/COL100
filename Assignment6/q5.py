# returns True if arr1 < arr2  (Fine)
def arrcompare(arr1, arr2):
    if arr1 == [] or arr2 == []:
        return False
    if (len(arr1) < len(arr2)):
        return True
    elif (len(arr1) > len(arr2)):
        return False
    else:
        for i in range(len(arr1)):
            if (arr1[i] < arr2[i]):
                return True
            elif (arr1[i] > arr2[i]):
                return False
    return False


# removes leading zeroes  (Fine)
def removeleadingzeroes(arr):
    if arr == []:
        return arr
    i, j = 0, 0
    for i in range(len(arr)):
        if arr[i] == 0:
            j = j+1
        else:
            break
        i += 1
    return (arr[j:])


# adds two numbers represted as array (Fine)
def add(a, b):
    if a == []:
        return b
    elif b == []:
        return a
    tempa = a
    tempb = b
    tempa.reverse()
    tempb.reverse()
    n1 = len(a)
    n2 = len(b)
    if(n1 >= n2):
        n = n1
        n3 = n2
    else:
        c = tempb
        tempb = tempa
        tempa = c
        n = n2
        n3 = n1

    ans = [0]*(n+1)
    for i in range(0, n3):
        ans[i] += (tempa[i] + tempb[i])
        ans[i+1] += (tempa[i] + tempb[i]) // 10
        ans[i] = ans[i] % 10

    for i in range(n3, n):
        ans[i] += (tempa[i])
        ans[i+1] += (tempa[i]) // 10
        ans[i] = ans[i] % 10
    ans.reverse()
    a.reverse()
    b.reverse()
    return removeleadingzeroes(ans)


# subtracts two numbers represented as array (Fine)
def subtract(arr1, arr2):
    if arr2 == []:
        return arr1
    elif arr1 == [] and arr2 == []:
        return []
    arr1.reverse()
    arr2.reverse()
    while(len(arr2) != len(arr1)):
        arr2.append(0)
    ans = []
    i = 0
    while(i < len(arr2)):
        if(arr1[i] >= arr2[i]):
            ans.append(arr1[i]-arr2[i])
        else:
            ans.append(arr1[i]-arr2[i]+10)
            arr1[i+1] = arr1[i+1]-1
        i = i+1
    ans.reverse()
    arr1.reverse()
    arr2.reverse()
    arr2 = removeleadingzeroes(arr2)
    arr1 = removeleadingzeroes(arr1)
    ans = removeleadingzeroes(ans)
    return ans


# increments a number represented as array by 1 (Fine)
def inc(arr):
    arr.reverse()
    if(len(arr) == 0):
        arr.append(0)
    arr[0] = arr[0]+1
    i = 0
    while(i < len(arr)-1):
        if(arr[i] > 9):
            arr[i] = arr[i]-10
            arr[i+1] = arr[i+1]+1
        i = i+1
    if(arr[len(arr)-1] > 9):
        arr[len(arr)-1] = arr[len(arr)-1]-10
        arr.append(1)
    arr.reverse()
    return arr


# returns true if the two arrays are exactly same (Fine)
def samearr(arr1, arr2):
    if arr1 == [] and arr2 == []:
        return True
    elif arr1 == [] and arr2 != []:
        return False
    elif arr1 != [] and arr2 == []:
        return False
    else:
        if len(arr1) != len(arr2):
            return False
        for i in range(len(arr1)):
            if arr1[i] != arr2[i]:
                return False
        return True


# helper for adding
def makeEqual(a, b):
    temp = []
    for i in range(0, len(a)-len(b)):
        temp.append(0)
    for i in range(0, len(b)):
        temp.append(b[i])
    return temp


# another try at making add function (Fine)
def adds(a, b):
    ans, temp = [], []
    b = makeEqual(a, b)
    a = makeEqual(b, a)
    c, j = 0, len(a)-1
    for i in range(0, len(a)+1):
        ans.append(0)
    while(j >= 0):
        if(a[j]+b[j]+c < 10):
            ans[j+1] = a[j]+b[j]+c
            c = 0
        else:
            ans[j+1] = (a[j]+b[j]+c) % 10
            c = (a[j]+b[j]+c)//10
        j -= 1
    ans[0] = c
    if(c == 0):
        for i in range(1, len(ans)):
            temp.append(ans[i])
        return temp
    else:
        return ans


# returns true if arr1 is multiple of arr2 * [1...9] (Fine)
def multiplecheck(arr1, arr2):
    temp = arr2
    temp3 = 0
    for i in range(10):
        # print(temp3)
        if samearr(arr1, arr2):
            return True
        else:
            arr2 = adds(arr2, temp)
    return False


# A helper function for every step in actual divide function
def helper(arr1, arr2):
    q = 0
    temp = [0]*(len(arr1))
    if multiplecheck(removeleadingzeroes(arr1), removeleadingzeroes(arr2)):
        while arrcompare(temp, arr1):
            q += 1
            temp = add(temp, arr2)
        return temp, q
    else:
        templag = 0
        while arrcompare(temp, arr1):
            templag = temp
            q += 1
            temp = add(temp, arr2)
        q -= 1
        return templag, q


# To add zeroes
def appendzeroes(arr, length):
    for i in range(length):
        arr.append(0)
    return arr


# Actual divide function
def divide(dividend, divisor):
    dividend = removeleadingzeroes(dividend)
    divisor = removeleadingzeroes(divisor)
    quotient = []
    remainder = []
    if(arrcompare(dividend, divisor)):
        quotient.append(0)
        remainder = dividend
        return quotient, remainder
    else:
        tempdividend = []
        while not arrcompare(dividend, divisor):

            tempdividend = dividend[0:len(divisor)]
            if arrcompare(tempdividend, divisor):
                tempdividend = dividend[0:len(divisor)+1]
            (tominus, q) = helper(tempdividend, divisor)
            quotient.append(q)
            # print(tominus)
            numberofzeroes = (len(dividend) - len(tempdividend))
            appendzeroes(tempdividend, numberofzeroes)
            appendzeroes(tominus, numberofzeroes)
            dividend = subtract(dividend, tominus)
            if dividend == []:
                break
        remainder = dividend
        if dividend == removeleadingzeroes(divisor):
            remainder = [0]
            inc(quotient)
        return(removeleadingzeroes(quotient), remainder)


# To test the function
print(divide([3, 5, 7, 2], [7, 2]))
print(divide([1, 2], [4]))
print(divide([2, 1, 2, 2, 2], [1, 1, 1, 1]))
print(divide([1, 3, 7, 0, 9, 7, 4], [1, 2, 3, 4]))
print(divide([1, 2, 0], [5]))
