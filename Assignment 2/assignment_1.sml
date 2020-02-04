fun factorial(n) = 
    if (n = 0) then 1 
    else n*factorial(n-1);

fun factiter(n)=
    let
      fun fact_iter(m,f,i)=
        if (i=m) then f
        else fact_iter(m,(f*(i+1)),i+1);
    in
      fact_iter(n,1,0)
    end;

fun exp(x,n)=
    if (n=0) then 1
    else if (n=1) then x
    else x*exp(x,n-1);

fun expiter(x,n)=
    let
      fun exp_iter(x,n,f,i) = 
        if (i=n) then f
        else exp_iter(x,n,f*x,i+1);
    in
      exp_iter(x,n,1,0)
    end;

fun fastpow(x,n) =
	let 
		fun fastpowiter(x,n,f) =
			if (n=0) then f
			else if (n mod 2 =1) then fastpowiter(x*x,n div 2, x*f)
			else fastpowiter(x*x,n div 2, f)
	in 
		fastpowiter(x,n,1)
	end;

fun fibrec(n) =
    if (n=1) then 1
    else if (n=2) then 1
    else fibrec(n-1) +fibrec(n-2) ;

fun fibiter(n) = 
    let
      fun fib_iter(n,a,b) = 
        if (n=1) then a
        else if(n=2) then b
        else fib_iter(n-1,b,a+b);
    in
      fib_iter(n,1,1)
    end;

fun isqrt(n) = 
	if (n=0) then 0
	else
		let val m = isqrt (n div 4)
		in if ((2*m +1)*(2*m +1) > n) then 2 *m
		else  2 * m +1
		end;

fun perfect (n) =
    let fun addfactors (n)=
        let fun f(i) =
                if (n mod i = 0) then i
                else 0;
            fun sum (a,b) =
                if a>b then 0
                else f(b) + sum(a,b-1);
        in sum (1, n div 2)
        end;
    in (n = addfactors(n))
end;
