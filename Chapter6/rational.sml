signature Rational =
sig
  type number;
  val makerat : int * int -> number;
  val plus : number*number -> number;
end


structure RAT1 : Rational =
struct
    datatype number = ratify of int*int;

    exception DenomZero;

    fun gcd(a,b) = 
        if b =0 then a
        else gcd(b,a mod b)
    
    fun makerat(n:int,d:int) : number =
        if d=0 then raise DenomZero
        else
            let
              val pn = abs(n);
              val pd= abs(d);
              val sign = 
                if n=0 then 0
                else (n div pn) * (d div pd);
              val g = gcd(pn,pd);
            in
              ratify(sign* pn div g, pd div g)
            end;
    
    fun numer(ratify(x,_)) = x;
    fun denom(ratify(_,y)) = y;

    fun plus(a,b)=
        let
            val x=numer(a)* denom(b) + numer(b) * denom(a);
            val y = denom(a) * denom(b);
        in
            makerat(x,y)
        end;


end;