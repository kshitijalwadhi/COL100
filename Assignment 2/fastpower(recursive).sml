fun fastpow(x,n) = 
    if(n=0) then 1
    else if ((n mod 2)=1) then x* fastpow(x,n div 2) * fastpow(x,n div 2)
    else fastpow(x,n div 2) * fastpow(x,n div 2) ;