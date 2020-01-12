fun exp_iter(x,n,f,i) = 
    if (i=n) then f
    else exp_iter(x,n,f*x,i+1);