fun prime(n,t) =
    let
      fun prime_actual(n,t,result)=
        let
          fun fermat(n)=
            let
              fun expmod(a,b,m)=
                if b=0 then 1
                else if (b mod 2) =0 then (expmod(a,b div 2, m)* expmod(a,b div 2,m) ) mod m
                else ((a mod m) * expmod(a,b -1,m))mod m
            in
              let
                val nextInt = Random.randRange (1,100)
                val r = Random.rand (1,1)
                val p = nextInt r
              in
                (p = expmod(p,n,n))
              end
            end;
        in
          if t=0 then true
          else if result then false
          else prime_actual(n,t-1,not(fermat(n)))
        end;
    in
      if(n=2) then true
      else prime_actual(n,t,false)
    end;