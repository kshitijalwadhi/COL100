fun mult_by_digit_rec(m,d) = 
    if m =0 then 0
    else (m mod 10) * d + 10* mult_by_digit_rec(m div 10, d);

fun mult_by_digit_iter(m,d) =
    let
        fun exp(x,n)=
            if (n=0) then 1
            else if (n=1) then x
            else x*exp(x,n-1);
      fun iter(m,d,p,ans)=
        if m = 0 then ans
        else iter(m div 10, d, p+1, ans + exp(10,p) * (m mod 10 * d) );
    in
      iter(m,d,0,0)
    end;