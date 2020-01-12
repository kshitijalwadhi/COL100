fun fact_iter(m,f,i)=
    if (i=m) then f
    else fact_iter(m,(f*(i+1)),i+1);