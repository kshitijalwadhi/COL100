fun foldr f b [] = b
    | foldr f b (x::xs) = f(x,foldr f b xs);

fun length xs = foldr (fn(_,y) => y+1) 0 xs;

fun sumr xs = foldr op+ 0 xs;

fun append(xs,ys) = foldr op:: ys xs