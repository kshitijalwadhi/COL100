fun reverse(n)=
    let fun numdigits(n)=
            if(n>0) then (numdigits(n div 10) +1)
            else 0;
        fun exp(x,n)=
            if (n=0) then 1
            else if (n=1) then x
            else x*exp(x,n-1);

    in  
        if (n=0) then 0
        else (n mod 10) * exp(10,numdigits(n)-1) + reverse(n div 10)
    end;
