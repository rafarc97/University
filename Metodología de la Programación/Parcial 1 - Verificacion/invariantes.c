entero funcion_factorial(E entero:n)
{ n=N>=0}   P
inicio
	k<-0
	f<-1
	P{}
	mientras k<n B hacer
		k=k+1  S1
		f=f*k
	fin_mientras
	{f=N!}	Q
	devolver f;
fin_funcion


{  n=N>=0 ^ k=0 ^ f=1    } P
mientras k<n B hacer {I}
		k=k+1  S1
		f=f*k
	fin_mientras
	{f=N!}	Q


	n 	k 	f
	4	0	1
	4	1	1
	4	2	2
	4	3	6
	4	4	24

	I={ n=N>=0 ^ k<=n ^ f=k! }
  0                                 4
  			1						4
  					2				4
  							3		4
  									4
//Correccion total
I ^ B => t >0  //t es una funcion monotona decreciente con cota 0   t=n-k
n=N>=0 ^ k<=n ^ f=k! ^ k<n => n-k > 0

{I ^ B ^ t=T}S{t<T}
{n=N>=0 ^ k<=n ^ f=k! ^ k<n ^ n-k=T} S { n-k < T}

//-------------------------------------------------------------------------

{ z=(A-x)B ^ y=B>=0 ^ r=0 } P
 mientras r<y B hacer {I}
	z=z+1
	r=r+1
 fin_mientras
 x=x-1
{ z=(A-x)B } Q

B=4
A=2
x=5
	z		y		r
	-12		4		0
	-11		4		1
	-10		4		2
	-9		4		3
	-8		4		4



	z				y			r
	(A-x)B			B			0
	(A-x)B+1		B			1
	(A-x)B+2		B			2
	(A-x)B+3		B			3
								.
								.
								B

I={ y=B>=0 ^ r<=y ^ z=(A-x)B+r }   t=y-r

//------------------------------------------------------------------------

{ z=A ^ n>0 ^ i=0 ^ x=1} P
mientras i<n B hacer {I}
	x=z*x
	i=i+1
fin_mientras
{x=A^n} Q
devolver x

A=3
n=4
	z		n 		i 		x
	3		4		0		1
	3		4		1		3
	3		4		2		9
	3		4		3		27
	3		4		4		81


	I={ z=A ^ n>0 ^ i<=n ^  x=A^i}   t=n-i

//------------------------------------------------------------------------

{ x=A ^ y=B ^ y>=0 ^ r=1} P
mientras y>0 B hacer  {I}
	si impar(y) entonces
		y=y-1
		r=r*x
	si_no
		y=defecto(y/2)
		x=x*x
	fin_si
fin_mientras
{r=A^B} Q

A=3
B=3
	x 		y 		r
	3		3		1
	3		2		3
	9		1		3
	9		0		27

	I={ y>=0 ^ r=A^B/x^y } t=y

//--------------------------------------------

{x=A ^ y=B  ^ y>=0 ^ acum=0}
mientras y!=0 hacer
	si impar(y)
		acum=acum+x
		y=defecto((y-1)/2)
	si_no
		y=defecto(y/2)
	fin_si
	x=2*x
fin_mientras
{acum=A*B}

//-----------------------------------------------------------------
{n=N>0 ^ suma=0 ^ cont=0} P

	mientras cont < n hacer {I}
		cont=cont+1
		suma=suma+cont
	fin_mientras


	res=defecto(suma/cont)

{res=defecto(sum[a=0][N]a / N)} Q
devolver res
fin_funcion

n=5
	n  			cont 			suma  			res
	5			0				0
	5			1				1
	5			2				3
	5			3				6
	5			4				10
	5			5				15
												15/5=3


		I={ n=N>0 ^ cont <= n  ^ suma= sum[a=0][cont]a }

//-----------------------------------------------------------
{n=N>=0 ^ a1=0 ^ a2=0 ^ cont=1}
		mientras cont <= n hacer
			si par(cont)
				a2=a2+2*cont-1
			si_no
				a1=a1+2*cont-1
			fin_si
			cont=cont+1
		fin_mientras
{ a1+a2 = sum[a=1][N](2*a-1)}


	n 			a1 				a2   		a1+a2		cont
	5			0				0			0			1
	5			1				0			1			2
	5			1				3			4			3
	5			6				3			9			4
	5			6				10			16			5
	5			15				10			25			6

	I={ n=N>=0 ^ cont <= n+1 ^ a1+a2=sum[a=1][cont-1] (2*a-1) }		


			25 = 	1 + 3 + 5 + 7 + 9

			9=1+3+5

//---------------------------------------------------------
{ n=N>0 ^ x=A[1..N] ^ i=1 ^ prod=1 }
	
	mientras i<=n hacer
			prod=prod*x[i]
			i=i+1
	fin_mientras

{ prod= product[a=1][N]x[a]}

devolver prod

n=4
A={1,2,3,4}

	n 		prod 		i
	4		1			1
	4		1*1			2
	4		1*1*2		3
	4		1*1*2*3		4
	4		1*1*2*3*4   5


	I={ n=N>0 ^ i<=n+1 ^ prod=product[a=1][i-1]x[a]}

	prod=1*2*3*4

	prod=1*2

//---------------------------------------------------
	{n=N>0 ^ x=A[1..N] ^ suma=0 ^ cont=1 }
		mientras cont <= n hacer
			suma=suma+x[cont]
			cont=cont+1
		fin_mientras
		cont=cont-1
		res=defecto(suma/cont)

	{ res= defecto(sum[a=1][N] x[a] / N) }













	






