(* fun mult x y = x*y

fun double x = (mult 2)x

val double_test = mult 2 *)

fun compose f g x = f(g(x))
(* op o is equivalent to compose *)

fun repeat f n = 
    if n = 0 then (fn x => x)
    else f o (repeat f (n-1)) 

fun try x = x+1

fun deriv dx f x = (f(x+dx) - f(x))/dx

fun nderiv n dx = repeat (deriv dx) n

fun cube x:real = x*x*x
