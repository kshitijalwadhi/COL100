fun fastpow(x,n) =
	let 
		fun fastpowiter(x,n,f) =
			if (n=0) then f
			else if (n mod 2 =1) then fastpowiter(x,n-1, x*f)
			else fastpowiter(x*x,n div 2, f)
	in 
		fastpowiter(x,n,1)
	end;
