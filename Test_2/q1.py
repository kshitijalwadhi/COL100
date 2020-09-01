def addNumbers(num1, num2):
    # assert: 2 numbers represented in the form of arrays num1, num2 having same number of digits established.

    n = len(num1)

    sumArr = [0]*(n+1)

    cur_i = n-1
    cur_k = n

    carry = 0
    temp = 0

    # INV: temp carries the sum of the digits mod 10, carry takes the carry forward to the next digits addition.
    # after each iteration, the cur_K index of sumArr is updated

    while(cur_i >= 0):
        temp = num1[cur_i] + num2[cur_i] + carry
        sumArr[cur_k] = temp % 10
        carry = temp//10
        cur_i -= 1
        cur_k -= 1

    if(carry == 1):
        sumArr[0] = 1

    # assert: sumArr is the array representation of the sum of the two numbers n1 and n2
    return sumArr


def mulNumbers(num1, num2):
    # assert: 2 numbers represented in the form of arrays num1, num2 having same number of digits established.

    n = len(num1)

    ans = []
    cur_j = n-1
    numZero = 0

    # comment: this loop is for iterating over the digits of the second number whose digits will be one by one multiplied with the first number
    for p in range(cur_j, -1, -1):

        mulArr = []
        cur_i = n-1
        carry = 0
        temp = 0

        # INV: temp carries the multiplication of the digits mod 10, carry takes the carry forward to the next digits multiplication.
        # after each iteration, temp mod 10 is appended to the array.

        while(cur_i >= 0):
            temp = num1[cur_i] * num2[cur_j] + carry
            mulArr.append(temp % 10)
            carry = temp//10
            cur_i -= 1

        mulArr.append(carry)
        mulArr.reverse()
        if(numZero == 0):
            ans = mulArr

        # comment: appending the zeros at the end
        if(numZero > 0):
            zeroArr = [0]*numZero
            mulArr.extend(zeroArr)

            lenMul = len(mulArr)
            lenAns = len(ans)

            # commment: making sure the length of arrays is same so that first function can be used.
            if(lenMul < lenAns):
                mulArr.reverse()
                forwardZeros = [0]*(lenAns-lenMul)
                mulArr.extend(forwardZeros)
                mulArr.reverse()

            elif(lenMul > lenAns):
                ans.reverse()
                forwardZeros = [0] * (lenMul-lenAns)
                ans.extend(forwardZeros)
                ans.reverse()

            ans = addNumbers(ans, mulArr)
        cur_j -= 1
        numZero += 1

    # assert: ans is the array representation of the multiplication of the two numbers n1 and n2
    return ans


# a = [3, 9]
# b = [6, 0]

# print(addNumbers(a, b))

# p = [9, 3, 7]
# q = [1, 2, 0]

# print(mulNumbers(p, q))
