(* Answer 1 *)

fun deriv dx f = (fn x => (f(x+dx) - f(x))/dx);

(* val deriv = fn : (real -> real) -> real -> real -> real *)


(* Answer 2 *)

fun compose f g x = f(g(x));

fun repeat f n = 
    if n= 0 then (fn x => x)
    else f o (repeat f (n-1))


(* Answer 3 *)

fun cube x:real = x*x*x

fun nthderiv n dx = repeat (deriv dx) n

(* Invocation: nthderiv 2 0.002 cube 2.0; *)