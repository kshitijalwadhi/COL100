fun fact(n)=
    let
      fun fact_iter(m,f,i)=
        if (i=m) then f
        else fact_iter(m,(f*(i+1)),i+1);
    in
      fact_iter(n,1,0)
    end;