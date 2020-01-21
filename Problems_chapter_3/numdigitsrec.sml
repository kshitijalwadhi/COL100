fun numdigits(n)=
    if(n>0) then (numdigits(n div 10) +1)
    else 0;