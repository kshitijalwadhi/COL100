fun acc(a,b,even,odd,next,oper,iden)=
    if b=0 then iden
    else if b mod 2 =0 then oper(even(b),acc(a,next(b),even,odd,next,oper,iden))
    else oper(odd(b),acc(a,next(b),even,odd,next,oper,iden));

fun fastpow(x,n)=
    let
      fun even(n) =1;
      fun odd(n)=x;
      fun next(n) = n div 2;
      fun oper(a,b) = a*b*b;
    in
      acc(x,n,even,odd,next,oper,1)
    end;

fun mult(a,b) =
    let
      bindings
    in
      body
    end