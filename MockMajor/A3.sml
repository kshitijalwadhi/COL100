exception InsufficientLength

fun kthodd([],k) = raise InsufficientLength
    | kthodd(x::y::xs,1) = x
    | kthodd(x::y::xs,k) = kthodd(xs,k-1)


(* 

Induction Hypothesis: kthodd(list,k) gives the number at kth odd position in the list

Basis: kthodd(x::y::xs,1) gives the element at first position, i.e. x

Induction Step: kthodd(ls,k) = kthodd(x::y::xs,k) = kthodd(xs,k-1)
    (Removed the first 2 elements)

 *)
