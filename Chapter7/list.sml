exception EmptyList;

fun sumlist([])=0
    | sumlist(h::t) = h + sumlist t;
fun empty([]) = true
    | empty(x::ls) = false;

fun attach(x,ls) = x::ls;

fun head([]) = raise EmptyList
    | head(x::ls) = x;

fun tail([]) = raise EmptyList
    | tail(x::ls) = ls;

fun singleton([]) = false
    | singleton(x::[])=true
    | singleton(ls) = false;

fun max([]) = raise EmptyList
    | max(x::[]) = x
    | max(x::ls) =
        if (x>max(ls)) then x
        else max(ls);

fun length([]) =0
    | length(x::ls) = length(ls) +1;
    
fun lengthiter(ls) =
    let
        fun length_iter([],len) = len
        | length_iter(x::ls,len) = length_iter(ls,len+1)
    in
        length_iter(ls,0)
    end;

fun append([],l2) = l2
    | append(x::ls,l2) =x::append(ls,l2);

fun nth(n,[]) = raise EmptyList
    | nth(n,x::ls) = 
        if n=0 then x
        else nth(n-1,ls);

fun reverse([]) = []
    | reverse(x::ls) = append(reverse(ls),x::[]);

fun reviter(ls)=
    let
      fun rev_iter([],rev) =rev
        | rev_iter(x::ls,rev) = rev_iter(ls,x::rev)
    in
      rev_iter(ls,[])
    end;

fun merge([],l2) = l2
    | merge(l1,[]) = l1
    | merge(x::l1,y::l2) = 
        if x<=y then x::merge(l1,y::l2)
        else y::merge(x::l1,l2);

fun insort([]) = []
    | insort(x::ls)=merge(x::[],insort(ls));

fun insortiter(ls)=
    let
      fun insort_iter([],result)=result
        | insort_iter(x::ls,result) = insort_iter(ls,merge(x::[],result))
    in
        insort_iter(ls,[])
    end;

fun mergesort([]) = []
    | mergesort(x::[]) = x::[]
    | mergesort(ls) =
        let
          fun split(ls) =
            let
              fun splititer([],i,l1,l2) = (l1,l2)
              | splititer(x::ls,i,l1,l2) = 
                    if (i mod 2) =0 then splititer(ls,i+1,x::l1,l2)
                    else splititer(ls,i+1,l1,x::l2)
            in
              splititer(ls,1,[],[])
            end
          val(l1,l2) = split(ls)
        in
          merge(mergesort(l1),mergesort(l2))
        end;