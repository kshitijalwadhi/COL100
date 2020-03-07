(* Helper Functions *)

fun empty([]) = true
    | empty(x::ls) = false;

fun length([])=0
    | length(x::ls) = 1 + length(ls);

fun head([]) =0
    | head(x::ls) =x;

fun tail([]) =[]
    | tail(x::ls) = ls;

fun max(a,b) = 
    if a>=b then a
    else b;

fun append1([],l2) = l2
    | append1(x::ls,l2) =x::append1(ls,l2);

fun reverse([]) = []
    | reverse(x::ls) = append1(reverse(ls),x::[]);

(* Code for addition of 2 numbers represented as lists *)

fun add(ls1,ls2)=
    let
      fun carry([]) = [1]
        | carry(x::ls) = (x+1)::ls;
      fun add_iter(l1,l2,l3)=
        if empty(l1) andalso empty(l2) then l3
        else if (head(l1) +head(l2))>9 then add_iter(carry(tail(l1)),tail(l2),((head(l1) +head(l2)) mod 10)::l3)
        else add_iter(tail(l1),tail(l2), (head(l1) + head(l2))::l3)
    in
      reverse(add_iter(ls1,ls2,[]))
    end;

(* Code for subtraction of 2 numbers represented as lists *)

(* Assumed that ls1 > ls2 *)
fun subtract(ls1,ls2) = 
    let
      fun carry([]) =[0]
        | carry(x::ls) = (x-1)::ls;
      fun sub_iter(l1,l2,l3) =
        if empty(l1) andalso empty(l2) then l3
        else if (head(l1) - head(l2))<0 then sub_iter(carry(tail(l1)),tail(l2),(head(l1) -head(l2) +10)::l3) 
        else sub_iter(tail(l1),tail(l2),(head(l1) -head(l2))::l3)
      fun removestartingzero([])=[]
        | removestartingzero(x::ls)=
            if x=0 then removestartingzero(ls)
            else x::ls;
    in
        reverse(removestartingzero(sub_iter(ls1,ls2,[])))
    end;

(* Code for multiplication of 2 numbers represented as lists *)

(* Helper function *)
fun update([x])=
            if x>=10 then (x mod 10)::[x div 10] 
            else [x] 
    | update([]) = []
    | update(x::y::xs)=
            if x>=10 then (x mod 10)::update((y + x div 10)::xs)
            else x::update(y::xs);

(* Actual function *)
fun multiply(ls1,ls2) = 
    let
      fun putzero(n) = if n = 0 then [] else 0::putzero(n-1);
      fun mul(x::xs,[]) = [] 
        | mul([],x::xs) = []
        | mul([],[]) = []
        | mul(x::xs,y::ys) = update((x*y)::mul(x::xs,ys));
      
      fun multiply_iter(ls1,ls2,b,n)=
        if ls2 = [] then []
        else
            if ls1 = [] then b
            else multiply_iter(tail(ls1),ls2,add(b,putzero(n)@mul(ls1,ls2)),n+1);
    in
      multiply_iter(ls1,ls2,[],0)
    end;
