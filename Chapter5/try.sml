fun acc(f,a,b,succ,oper,iden) =
	if (a>b) then iden
	else oper(f(a),acc(f,succ(a),b,succ,oper,iden));

fun fact(n) = acc(fn x => x, 1,n, fn x => x+1, op*,1);


fun acc2(f,xseq,n,succ1,succ2,oper,iden)=
	if(n=0)then iden 
	else oper(f(xseq,n),acc2(f,succ1(xseq),succ2(n),succ1,succ2,oper,iden));
fun power(x,n)=
	let fun  f(x,y)=
		if(y mod 2=0)then 1
		else x
	in acc2(f,x,n,fn x=>x*x,fn x=>x div 2,op*,1)
	end;



fun acc1(a,b,succ,oper,iden) =
	if (a > b) then iden
	else if((b+1) mod a =0)then oper(a,acc1(succ(a),b,succ,oper,iden))
	else acc1(succ(a),b,succ,oper,iden);
fun perfect(n)=
	n=acc1(1,n-1,fn x=>x+1,op+,0);




fun expsum(x,n) = 
		let
			fun term x n = real(power(x,n))*(1.0/real(fact(n)))
			fun next(n) = n+1
		in
			acc(term(x),0,n,next,op+,0.0)
		end; 




fun sum(f,a,b,c,d)=
	acc((fn i=>acc(f(i),c,d,fn x=>x+1,op+,0)),a,b,fn x=>x+1,op+,0);




signature MyInterval =
	  sig
	  type interval;
	  val makeinterval: real*real -> interval;
	  val intadd: interval*interval->interval;
	  val intsubtract: interval*interval->interval;
	  val intmult: interval*interval->interval;
	  val intdiv: interval*interval->interval;
	  end;


structure INT1:MyInterval=
	struct
	datatype interval=construct of real*real;
	exception NotPossible;
	fun makeinterval(p:real,q:real):interval=
		if(p>q)then raise NotPossible
		else construct (p,q);
	fun lower_bound(construct(x,_))=x;
	fun upper_bound(construct(_,y))=y;
	fun intadd(a,b)=
		let 
			val x=lower_bound(a)+lower_bound(b);
			val y=upper_bound(a)+upper_bound(b);
		in 
			makeinterval(x,y)
		end;
	fun intsubtract(a,b)=
		let 
			val x=lower_bound(a)-lower_bound(b);
			val y=upper_bound(a)-upper_bound(b);
		in 
			if(x>y)then raise NotPossible
			else makeinterval(x,y)
		end;
	fun intmult(a,b)=
		let 
			val x=lower_bound(a)*lower_bound(b);
			val y=upper_bound(a)*upper_bound(b);
		in 
			makeinterval(x,y)
		end;
	fun intdiv(a,b)= 
		let
			val x=lower_bound(a)*(1.0/lower_bound(b));
			val y=lower_bound(a)*(1.0/lower_bound(b));
		in 
			if(x>y)then raise NotPossible
			else makeinterval(x,y)
		end;
	end;