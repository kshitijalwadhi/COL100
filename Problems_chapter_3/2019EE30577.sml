fun num_iter(n)=
    let fun digitcount(n,i) =
        if(n>0) then digitcount(n div 10, i+1)
        else i;
    in digitcount(n,0)
    end;

fun num_rec(n)=
    if(n>0) then (num_rec(n div 10) +1)
    else 0;

fun ami(a,b)=
    let fun addfactors(n)=
        let fun f(i)=
                if (n mod i =0) then i
                else 0;
            fun sum(x,y) =
                if x>y then 0
                else f(y) + sum(x,y-1);
        in sum(1,n div 2)
        end;
    in ((a=addfactors(b)) andalso (b=addfactors(a)))
    end;

fun rev_iter(n) = 
    let fun reverse_iter(n,i) = 
            if(n=0) then i
            else reverse_iter(n div 10, i*10 + n mod 10)
    in reverse_iter(n,0)
    end;

fun rev_rec(n)=
    let fun numdigits(n)=
            if(n>0) then (numdigits(n div 10) +1)
            else 0;
        fun exp(x,n)=
            if (n=0) then 1
            else if (n=1) then x
            else x*exp(x,n-1);

    in  
        if (n=0) then 0
        else (n mod 10) * exp(10,numdigits(n)-1) + rev_rec(n div 10)
    end;
