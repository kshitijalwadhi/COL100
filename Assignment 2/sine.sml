fun sin(x)=
    let
      fun next_term(x,n,prev)=
        (~1) * x * x / (2*n * (2*n+1)) * prev

      fun helper(x,n,i,ans,prev)=
        if i=n then ans
        else if i=0 then helper(x,n,i+1,ans+x,x)
        else helper(x,n,i+1,ans+next_term(x,i,prev),next_term(x,i,prev))
    in
      helper(x,20,1,0,0)
    end;