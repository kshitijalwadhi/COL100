fun summation(a,b,f,succ) =
    if (a>b) then 0
    else f(a) + summation(succ(a),b,f,succ);

fun sum(a,b) =
    let
      fun term(x) =x
      fun next(x) = x+1
    in
      summation(a,b,term,next)
    end;

fun sumsquare(a,b) = 
    let
      fun term(x) = x*x
      fun next(x) = x+1
    in
      summation(a,b,term,next)
    end;

fun real_summation(a,b,f,succ) = 
  if(a>b) then 0.0
  else f(a) + real_summation(succ(a),b,f,succ);

fun pisum(n)=
let
  fun term(x) = 1.0/real((x*(x+2)))
  fun next(x) = x+4
in
  real_summation(1,n,term,next) *8.0
end;

fun accumulator(a,b,f,succ,oper,iden) = 
  if (a>b) then iden
  else oper(f(a),accumulator(succ(a),b,f,succ,oper,iden));

fun newpisum(n) = 
let
  fun term(x) = 1.0/real((x*(x+2)))
  fun next(x) = x+4
in
  accumulator(1,n,term,next,op+,0.0) *8.0
end;

fun factorial(n)=
let
  fun term(x) = x
  fun next(x) = x+1
in
  accumulator(1,n,term,next,op*,1)
end;
