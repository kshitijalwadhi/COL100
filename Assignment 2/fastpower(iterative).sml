fun fastpow(x,n) =
	let 
		fun fastpowiter(x,n,f) =
			if (n=0) then f
			else if (n mod 2 =1) then fastpowiter(x,n div 2, x*f*f)
			else fastpowiter(x,n div 2, f*f)
	in 
		fastpowiter(x,n,1)
	end;
