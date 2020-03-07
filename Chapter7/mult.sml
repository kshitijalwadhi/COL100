fun append(x,y,i)=
	let fun iter(ls,x,y,i,j)=
		if(x*y<10)then
			if(j>i)then ls@[x*y]
			else iter(ls@[0],x,y,i,j+1)
		else 
			if(j>i)then ls@[x*y mod 10,x*y div 10]
			else iter(ls@[0],x,y,i,j+1)
	in
		iter([],x,y,i,1)
	end;
fun mult(a,b)=
	let 
		fun f(ls,[],b,k,i)= ls
		| f(ls,x::a,[],k,i)=f(ls,a,b,k+1,k+1)
		| f(ls,x::a,y::b,k,i)=
			f(add(ls,append(x,y,i)),x::a,b,k,i+1)
	in
		f([],a,b,0,0)
	end