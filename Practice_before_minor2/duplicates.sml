fun remove(x,ls)=
    if ls=[] then []
    else if x=hd(ls) then remove(x,tl(ls))
    else hd(ls)::remove(x,tl(ls));

fun update(ls)=
    if ls=[] then []
    else hd(ls)::remove(hd(ls),update(tl(ls)));