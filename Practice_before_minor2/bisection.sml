fun iter(f,acceptable,update,guess,epsilon)=
    if acceptable(guess,f,epsilon) then guess
    else iter(f,acceptable,update,update(guess,f),epsilon)

(* val iter = fn : ’a * (’b * ’a * ’c -> bool) * (’b * ’a -> ’b) * ’b * ’c -> ’b *)

fun bisection(f,interv,eps)=
let
    fun acceptable(interv,f,eps) = 
        let 
            val (a,b) = interv; 
        in 
            ((b - a) <= eps) 
        end;
    fun update(interv,f)=
        let
          val(a,b)=interv;
          val c =(a+b)/2.0
        in
          if (abs(f(c)) < eps) then (c-eps/2.0,c+eps/2.0)
          else if (f(a)*f(c)<0.0) then (a,c)
          else (c,b)
        end;
in
    iter(f,acceptable,update,interv,eps)
end;
