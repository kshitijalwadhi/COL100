fun prime(n) =
    let
      fun odd(n) = (n mod 2 =1)
      fun divtest(n) =
        let
          fun iter(n,test) =
            if (test*test >n) then n
            else if (n mod test = 0) then test
            else iter(n,test+2) 
        in
          iter(n,3)
        end;
    in
      (n=2) orelse (odd(n) andalso (n=divtest(n)))
    end;