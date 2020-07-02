/*
Diseña una función recursiva que calcule la i-ésima cifra de un entero n.
*/
int iesima(int n, int i)
{
	if(i==1) //caso base
		return n%10;
	else //caso general
	{
		return iesima(n/10, i-1);
	} 
}

/*
Diseña un algoritmo que localice de forma recursiva, en la misma pasada, el
máximo y el mínimo de un vector dado no vacío.
*/
void maxmin(int* v, int tam, int* max, int* min)
{
	if(tam>=0)
	{
		if(v[tam]>*max)
			*max=v[tam];
		if(v[tam]<*min)
			*min=v[tam];
		maxmin(v, tam-1, max, min);
	}
}

int main()
{
	int v[10]={2,5,3,8,9,1,0,3,2,4};
	int maximo=0, minimo=v[0];
	maxmin(v,10,&maximo, &minimo);
}

/*
Diseña una función recursiva que determine si en un vector A de n enteros existen
dos parejas consecutivas de elementos tales que sus sumas sean idénticas.
*/
//int v[10]={2,5,3,8,9,1,0,3,2,4};
int sumas_rec(int* v, int n, int i) ----------------> sumas(v,10,0)
{
	if(i>n-4)
		return 0;
	else
	{
		if(v[i]+v[i+1]==v[i+2]v[i+3])
			return 1;
		else
			sumas(v,n,i+1);
	}
}
int sumas(int* v, int n)
{
	sumas_rec(v,n,0);
}


//---------------------------------------------------------------------------------
//Transformacion Recursiva no final-->Final
funcion fun(x,y,n,i)
inicio
	si i=n
		devolver x[i]*y[i]
	sino
		devolver x[i]*y[i]+(n-i)*fun(x,y,n,i+1)
	finsi
fin_funcion

1.Reconocer que se trata de una recursiva no final
2.Identificar los elementos:
 
 x: x,y,n,i
 caso base: i=n
 sol(x): x[i]*y[i]
 suc(x): x,y,n,i+1
 comb(fun_rec(suc(x),x)): x[i]*y[i]+(n-i)*fun(x,y,n,i+1)

 3.Arbol sintactico

 				+

 		*					*

 x[i] 		y[i]	  -				fun

 					n   i         x y n  +

 										i  1

 4.Arbol sintactico con parametros de inmersion


 				+

 		sum   					*

 						prod			fun

 										x y n i 

 5.Funcion Inmersora

 fun_final(x,y,n,i,sum, prod)=sum+prod*fun(x,y,n,i)

 6.Elementos neutro

 fun_final(x,y,n,i,0, 1)=0+1*fun(x,y,n,i)

 funcion llamada(x,y,n,i)
 inicio
 	devolver fun_final(x,y,n,i,0, 1)
fin_funcion

7. Desplegado

funcion fun_final(x,w)
inicio
	si caso_base? entonces
		devolver comb(sol(x),w)
	sino
		devolver comb(comb(fun_rec(suc(x)),x),w)
	fin_si
fin_funcion

//------------------------------------------------------------
funcion fun_final(x,y,n,i,sum,prod)
inicio
	si i=n entonces
		devolver sum+prod*x[i]*y[i]
	sino
		//devolver sum+prod(x[i]*y[i]+(n-i)*fun(x,y,n,i+1))	

		devolver sum + prod*x[i]*y[i] + prod*(n-i)*fun(x,y,n,i+1)


	finsi
fin_funcion

8.Plegado

funcion fun_final(x,w)
inicio
	si caso_base? entonces
		devolver comb(sol(x),w)
	sino
		devolver fun_final(suc(x), comb(x,w))
	fin_si
fin_funcion

funcion fun_final(x,y,n,i,sum,prod)
inicio
	si i=n entonces
		devolver sum+prod*x[i]*y[i]
	sino
		devolver fun_final(x,y,n,i+1, sum + prod*x[i]*y[i], prod*(n-i))
	fin_si
fin_funcion

