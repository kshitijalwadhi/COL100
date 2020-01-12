fun fib_iter(n,a,b,i) = 
    if (n=i) then b
    else fib_iter(n,b,a+b,i+1);