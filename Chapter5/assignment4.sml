fun accumulator(x,a,b,f,succ,oper,iden,c) = 
  if (a>b) then iden
  else oper(f(x,a),accumulator(x,succ(a),b,f,succ,oper,iden,c));

fun expsum(x,n) = 
    let
        fun factorial(n) = 
            if (n = 0) then 1 
            else n*factorial(n-1);
        
        fun exp(x,n)=
            if (n=0) then 1
            else x*exp(x,n-1);

        fun term(x,n) = real(exp(x,n))/real(factorial(n))
        fun next(n) = n+1
    in
      accumulator(x,0,n,term,next,op+,0.0,0)
    end;

fun perfect(n)=
    let
      fun next(n) = n+1
      fun term(n,i)= 
        if(n mod i =0) then i
        else 0
    in
        accumulator(n,1,n div 2,term,next,op+,0,0)=n
    end

fun fastpow(x,n) =
    let
      fun term(x)=
      fun next(n) = 
    in
      accumulator(x,n,n,term,next,op*,1,n)
    end 

fun doublesummation(a,b,c,d,f,succ) =
    let val temp =c;
        fun doublesummation2(a,b,c,d,f,succ)= 
            if (a>b) then 0
            else if(c=d) then f(a,c) + doublesummation2(succ(a),b,temp,d,f,succ)
            else f(a,c) + doublesummation2(a,b,succ(c),d,f,succ)
    in 
    doublesummation2(a,b,c,d,f,succ)
    end;

(* fun sum2(a,b,c,d) =
    let
      fun term(x) =x
      fun next(x)=x+1
    in
      doublesummation(a,b,c,d,term,next)
    end; *)
