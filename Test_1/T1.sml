(* KSHITIJ ALWADHI *)
(* 2019EE30577 *)
(* Group 30 *)

(* Answer 2 *)

fun reverse(n) = 
    let fun reverse_iter(n,i) = 
            if(n=0) then i
            else reverse_iter(n div 10, i*10 + n mod 10)
    in reverse_iter(n,0)
    end;

(* 
The reverse_iter function follows the invariant given in the problem statement.
Everytime the function is executed, the length(number of digits) of n are getting reduced by 1.
Thus, the number of steps taken will be equal to the length of the number (number of digits)
This will be equal to: 
ceil(log(n)) for n not equal to a power of 10
log(n) for n equal to some power of 10
where ceil() is the ceiling function.
Therefore it is safe to say that the complexity is O(log n) 
*)

(* Answer 3 (a) *)

fun frog(n)=
    if n =1 then 1 else if n =2 then 2 else if n = 3 then 4
    else frog(n-1) + frog(n-2) + frog(n-3)

(* Logic: Since the frog can take jumps of length 1, 2 or 3. To reach the nth step, the frog can be at (n-1)th, (n-2)th or (n-3)th step. *)
(* Therefore, the recursive relation is establised. *)

(* Answer 3 (b) *)

fun frog_faster(n:IntInf.int)=
    let
      fun helper(n:IntInf.int,a:IntInf.int,b:IntInf.int,c:IntInf.int,i:IntInf.int)=
        if i=n then c
        else helper(n,b,c,a+b+c,i+1)
    in
      if n=1 then 1 else if n=2 then 2 else if n=3 then 4
      else helper(n:IntInf.int,1,2,4,3)
    end;

(* INV: (3<=i<=n) ^ ( a=frog(i-3) ^ b=frog(i-2) ^ c=frog(i-1) ) *)

(*
Logic: In this iterative definition, the previous values are being stored which are used in calculation at every step.
Whereas in the recursive definition, the growth was exponential.
The algorithm in b) part will take O(n) time and O(1) space complexity.
Whereas the algorithm a) grows exponentially both in time and space.
*)