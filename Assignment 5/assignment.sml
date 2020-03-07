(* Assignment 5 *)
(* Kshitij Alwadhi *)
(* 2019EE30577 *)
(* Group 30 *)

(* ########################################################### *)
(* Question 1 *)
(* ########################################################### *)

fun merge([],l2) = l2
    | merge(l1,[]) = l1
    | merge(x::l1,y::l2) = 
        if x<=y then x::merge(l1,y::l2)
        else y::merge(x::l1,l2);
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

(* ########################################################### *)
(* Question 2 (Graphs in the pdf file) *)
(* ########################################################### *)

(* Seed for random number generation. *)
val r = Random.rand (1,1);

(* Generate a list containing n random integers. *)
fun genlist n = if n = 0 then [] else (Random.randInt r)::(genlist (n-1));

(* Sample function whose execution time we want to measure. *)
fun merge([],l2) = l2
    | merge(l1,[]) = l1
    | merge(x::l1,y::l2) = 
        if x<=y then x::merge(l1,y::l2)
        else y::merge(x::l1,l2);
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

fun insortiter(ls)=
    let
      fun insort_iter([],result)=result
        | insort_iter(x::ls,result) = insort_iter(ls,merge(x::[],result))
    in
        insort_iter(ls,[])
    end;

(* Generate a list containing 100 random integers. Use bigger lists for
 * your experiments. *)
val l = genlist 5000;

(* Start the timer to begin measuring execution time. *)
val timer = Timer.startCPUTimer ();

(* Call the function to be measured. *)
val dl = mergesort(l);

(* Check the time recorded by the timer. *)
val time = Timer.checkCPUTimer timer;

(* Convert to number of milliseconds. *)
val ms = Time.toMilliseconds (#sys time);

(* Remarks: *)
(* From the complexities calculated in class *)
(* Insertion sort: O(n^2) *)
(* Merge sort: O(n logn) *)
(* This is evident from the plots as the insertion sort shoots up rapidly as n increases. *)


(* ########################################################### *)
(* Code for Question 3 *)
(* ########################################################### *)


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
fun update([]) = []
    | update([x])=
            if x>=10 then (x mod 10)::[x div 10] 
            else [x] 
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
