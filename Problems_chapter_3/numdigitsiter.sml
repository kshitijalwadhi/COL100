fun numdigits(n)=
    let fun digitcount(n,i) =
        if(n>0) then digitcount(n div 10, i+1)
        else i;
    in digitcount(n,0)
    end;