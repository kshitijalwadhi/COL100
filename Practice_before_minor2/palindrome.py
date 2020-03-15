def pal(a):
    i = 0
    flag = True
    # INV: 0<=i<=len(a)//2 -1 , a[k]==a[n-k-1] for all k belonging to iterator i
    while(flag == True):
        if(i > (len(a)//2-1)):
            return True
        elif(a[i] != a[len(a)-i-1]):
            flag = False
        else:
            i = i+1
    # assert: if flag is True then array is palindrome, else its not
    print(flag)
