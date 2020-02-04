fun maxpower(p,k) =
    let
      fun maxpowerd(p,k,m,temp) =
            if (temp*k<=p) then maxpowerd(p,k,m+1,temp*k)
            else m
    in
      maxpowerd(p,k,0,1)
    end;