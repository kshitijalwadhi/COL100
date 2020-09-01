fun mc91(n)=
    let fun mc91i(n,c)=
            if (c=0) then n
            else if (n>100 andalso (c<>0)) then mc91i(n-10,c-1)
            else if (n<=100 andalso (c<>0)) then mc91i(n+11,c+1)
            else 0;
    in mc91i(n,1)
    end;