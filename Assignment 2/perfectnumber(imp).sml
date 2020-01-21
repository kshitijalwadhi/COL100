fun perfect(n)=
    let fun addfactors(n)=
        let fun f(i)=
            if(n mod i =0 ) then i + n div i
            else 0;

            fun sum(a,b) =
                if(a>b) then 0
                else if(b> (n div b)) then f(b) + sum(a,b-1)
                else 0;
        in sum(1,n div 2)
        end;
    in (n = (addfactors(n)+1))
end;

