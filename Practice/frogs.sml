fun frogslow(n) = 
    if n=1 then 1 
    else if n=2 then 2
    else if n=3 then 4
    else frogslow(n-1) + frogslow(n-2) + frogslow(n-3);

fun frogfast(n) = 
    let
      fun iter(n,a,b,c,i) =
        if(i=n) then c
        else iter(n,b,c,a+b+c,i+1);
    in
      iter(n,1,2,4,3)
    end;