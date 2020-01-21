fun sumdigits(n) =
    let
        fun sumdigitsiter(f,n) =
            if (n=0) then f
            else sumdigitsiter(f+ (n mod 10), n div 10)
    in
        sumdigitsiter(0,n)
    end;

