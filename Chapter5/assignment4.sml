(* Assignment 4, KSHITIJ ALWADHI, 2019EE30577, Group 30 *)


(* Accumulator for expsum and perfect numbers *)

fun accumulator(x,a,b,f,succ,oper,iden) = 
  if (a>b) then iden
  else oper(f(x,a),accumulator(x,succ(a),b,f,succ,oper,iden));

(* Code for calculating e^x using series *)

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
      accumulator(x,0,n,term,next,op+,0.0)
    end;

(* Better code: *)

fun expsumbetter(x,n)=
    let
      fun term(x,n) = 
        if n=0 then 1.0
        else term(x,n-1) *real(x)/real(n);
      fun next(n) =n+1;
    in
      accumulator(x,0,n,term,next,op+,0.0)
    end

(* Code for checking perfect number *)

fun perfect(n)=
    let
      fun next(n) = n+1
      fun term(n,i)= 
        if(n mod i =0) then i
        else 0
    in
        accumulator(n,1,n div 2,term,next,op+,0)=n
    end


(* Double summation using sum accumulator *)

fun sum (c,d,f,succ,a)=
  if c>d then 0
  else f(a,c) + sum(succ(c),d,f,succ,a);

fun doublesum(a,b,c,d,succ,f) =
    let
      val temp =c;
      fun doublesum2(a,b,c,d,succ,f) =
        if a>b then 0
        else sum(c,d, f ,succ,a) + doublesum2(succ(a),b,temp,d,succ,f);
    in
      doublesum2(a,b,c,d,succ,f)
    end


(* Double summation aliter: (without using sum accumulator) *)

fun doublesummation(a,b,c,d,f,succ) =
    let val temp =c;
        fun doublesummation2(a,b,c,d,f,succ)= 
            if (a>b) then 0
            else if(c=d) then f(a,c) + doublesummation2(succ(a),b,temp,d,f,succ)
            else f(a,c) + doublesummation2(a,b,succ(c),d,f,succ)
    in 
    doublesummation2(a,b,c,d,f,succ)
    end;
   
(* Function to check working of double summation below: *)

(* fun powersum(a,b,c,d)=
  let
    fun next(x) =x+1;
    fun term(x,y) = fastpow(x,y); 
  in
    doublesummation(a,b,c,d,term,next)
  end; *)

(* fun powersum(a,b,c,d)=
  let
    fun next(x) =x+1;
    fun term(x,y) = fastpow(x,y); 
  in
    doublesum(a,b,c,d,next,term)
  end; *)


(* Abstract Data type *)

signature MyInterval =
sig
  type interval;
  val make_interval: real*real -> interval;
  val intadd: interval*interval -> interval;
  val intsubtract: interval*interval -> interval;
  val intmult: interval*interval -> interval;
  val intdiv: interval*interval -> interval;
end;

structure INT1:MyInterval =
struct
  datatype interval = construct of real*real;
  exception WrongIntervals;
  fun make_interval(p:real,q:real):interval=
    if p>q then raise WrongIntervals
    else construct(p,q);
  fun min(a:real,b:real) =
    if a>b then b
    else a;
  fun max(a:real,b:real)=
    if a>b then a
    else b;
  fun lower_bound(construct(x,_)) =x;
  fun upper_bound(construct(_,y)) =y;
  fun intadd(a,b)=
    let
      val x = lower_bound(a) + lower_bound(b);
      val y= upper_bound(a) + upper_bound(b);
    in
      make_interval(x,y)
    end;
  fun intsubtract(a,b) =
    let
      val x = lower_bound(a) - upper_bound(b);
      val y = upper_bound(a) - lower_bound(b);
    in
      if (x>y) then raise WrongIntervals
      else make_interval(x,y)
    end;
  fun intmult(a,b)=
    let
      val a1 = lower_bound(a);
      val a2 = upper_bound(a);
      val b1 = lower_bound(b);
      val b2 = upper_bound(b);

      val x = min( min(a1*b1,a1*b2),min(a2*b1,a2*b2) );
      val y = max( max(a1*b1,a1*b2),max(a2*b1,a2*b2) );
    in
      make_interval(x,y)
    end;
  fun intdiv(a,b)=
    let
      fun reciproc(a:interval)=
          let
            val a1=lower_bound(a);
            val a2 = upper_bound(a);
          in
            if a1>0.0 orelse a2<0.0 then make_interval(1.0/a2,1.0/a1)
            else raise WrongIntervals
          end;
    in 
      intmult(a,reciproc(b))
    end; 
end;

(* Minor Questions using accumulator *)

(* The new accumulator: *)

fun accumulator2(f,x,n,term,next,oper,iden) =
  if n=0 then iden
  else oper(f(x,n),accumulator2(f,term(x),next(n),term,next,oper,iden))


(* Fast power *)

fun fastpow(x,n) =
    let
      fun term(x)= x*x
      fun next(n) = n div 2
      fun f(x,y) = 
        if (y mod 2 =0) then 1
        else x
    in
      accumulator2(f,x,n,term,next,op*,1)
    end;

(* Multiply in O(log b) *)

fun mult(a,b)=
  let
    fun term(x)= 2*x;
    fun next(n) = n div 2;
    fun f(a,b) = 
      if (b mod 2 =1) then a else 0;
  in
    accumulator2(f,a,b,term,next,op+,0)
  end;
    
(* Divide *)
exception DivideByZero;

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
    if y=0 then raise DivideByZero
    else
      accumulator2(f,1,x,term,next,oper,(0,0))
    end;


(* fun multiter(a,b)=
  let
    fun iter(a,b,f)=
      if b=0 then f
      else if b mod 2 =0 then iter(a*2,b div 2,f)
      else iter(a*2,b div 2,f +a)
  in
    iter(a,b,0)
  end     *)
