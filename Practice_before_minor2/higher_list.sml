fun foldr f b [] =b
    | foldr f b (x::xs) = f(x, foldr f b xs);

fun length(ls)=
    let
      fun f(a,b) = 
        1+b
    in
      foldr f 0 ls
    end;

fun add(ls)=
    let
      fun f(a,b) = a+b
    in
      foldr f 0 ls
    end;

fun append(ls1,ls2)=
    let
      fun f(a,b)= a::b
    in
      foldr f ls2 ls1
    end