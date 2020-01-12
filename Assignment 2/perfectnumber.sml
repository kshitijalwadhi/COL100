fun perfect (n) =
    let fun addfactors (n)=
        let fun f(n,i) =
                if (n mod i = 0) then i
                else 0;
            fun sum (f,a,b,n) =
                if a>b then 0
                else f(n,b) + sum(f,a,b-1,n);
        in sum (f,1, n div 2,n)
        end;
    in (n = addfactors(n))
end;
