fun maxpow(n) =
    if (n div 4 = 0) then 1
    else 4*maxpow(n div 4);