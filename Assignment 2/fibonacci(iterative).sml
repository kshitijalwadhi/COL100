fun fib(n) = 
    let
      fun fib_iter(n,a,b,i) = 
        if (n=i) then b
        else fib_iter(n,b,a+b,i+1);
    in
      fib_iter(n,1,1,2)
    end;