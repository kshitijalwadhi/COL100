fun isqrt(n) = 
	if (n=0) then 0
	else
		let val m = isqrt (n div 4)
		in if ((2*m +1)*(2*m +1) > n) then 2 *m
		else  2 * m +1
		end;
