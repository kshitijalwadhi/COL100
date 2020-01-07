fun exp(x,n)=
    if (n=0) then 1
    else if (n=1) then x
    else x*exp(x,n-1);