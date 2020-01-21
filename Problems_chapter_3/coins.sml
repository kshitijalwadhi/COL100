fun ways(a)=
let fun d(n)=
        if (n=1) then 1
        else if (n=2) then 5
        else if (n=3) then 10
        else if (n=4) then 25
        else 50

    fun coin(a,n) = if(a<0) orelse (n=0) then 0
                    else if (a=0) then 1
                    else coin(a-d(n), n) + coin(a,n-1);
in coin(a,5)
end;

