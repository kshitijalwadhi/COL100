fun f(n)=
    let
      fun iter(n,a,b,i) =
            if n=0 then 1
            else if(i=n) then b
            else iter(n,b,i+1-b,i+1)
    in
      iter(n,0,1,0)
    end;