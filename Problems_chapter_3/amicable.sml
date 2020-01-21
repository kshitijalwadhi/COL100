fun amicable(a,b)=
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
