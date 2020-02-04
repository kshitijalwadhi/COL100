fun fibsum(n) = 
    let
      fun fib_itersum(n,a,b,i,sum) = 
        if(n=1) then 1
        else if(n=2) then 2
        else if (n=i) then sum
        else fib_itersum(n,b,a+b,i+1,sum+a+b);
    in
      fib_itersum(n,1,1,2,2)
    end;