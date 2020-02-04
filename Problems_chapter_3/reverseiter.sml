fun reverse(n) = 
    let fun reverse_iter(n,i) = 
            if(n=0) then i
            else reverse_iter(n div 10, i*10 + n mod 10)
    in reverse_iter(n,0)
    end;