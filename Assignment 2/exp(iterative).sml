fun exp(x,n)=
    let
      fun exp_iter(x,n,f,i) = 
        if (i=n) then f
        else exp_iter(x,n,f*x,i+1);
    in
      exp_iter(x,n,1,0)
    end;