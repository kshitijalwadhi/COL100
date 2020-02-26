fun accumulator2(f,x,n,term,next,oper,iden) =
  if n=0 then iden
  else oper(f(x,n),accumulator2(f,term(x),next(n),term,next,oper,iden));

fun divide(x,y)=
    let
      fun next(n) = n div 2;
      fun oper(l,(m,n))=
        if (l mod 2 =1) then 
            if (2*n+1 <y) then (2*m,2*n+1)
            else (2*m +1, 2*n +1-y)
        else if (2*n<y) then (2*m,2*n)
        else (2*m+1,2*n-y);
      fun f(x,n)=n;
      fun term(x)=x;
    in
      accumulator2(f,1,x,term,next,oper,(0,0))
    end


fun acc2(x,next,oper,iden) =
    if x=0 then iden
    else oper(x,acc2(next(x),next,oper,iden));

fun divide2(x,y) =
  let
    fun next(n) =n div 2;
    fun oper(l,(m,n))=
        if (l mod 2 =1) then 
            if (2*n+1 <y) then (2*m,2*n+1)
            else (2*m +1, 2*n +1-y)
        else if (2*n<y) then (2*m,2*n)
        else (2*m+1,2*n-y)
  in
    acc2(x,next,oper,(0,0))
  end