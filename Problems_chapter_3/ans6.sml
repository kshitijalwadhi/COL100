fun modulo(a,b) = 
    if((a-b) >0) then modulo(a-b,b)
    else a;

fun intdiv(a,b)=
    let fun intdiv(a,b,i) =
        if((a-b)>0) then intdiv(a-b,b,i+1)
        else i;
    in intdiv(a,b,0)
    end;