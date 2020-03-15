exception suberror;
fun sub(a,b)=
    let
        fun subhelper([],[],borrow)=
                if borrow =0 then []
            | subhelper([],b,borrow) = raise suberror
            | subhelper(a,[],borrow)=  subhelper(a,[0],borrow)
            | subhelper(x::xs,y::ys,borrow)=
                let
                    val digit = x-borrow-y
                in
                    if digit>=0 then digit::(subhelper(xs,ys,0))
                    else (digit+10)::(subhelper(xs,ys,1))
                end
    in
        subhelper(a,b,0)    
    end;