
//FUNCIONA
/*
1. Dado un vector A de n enteros ordenado crecientemente, diseñe una función
recursiva que devuelva su moda, es decir, el valor más frecuente de A.
*/

//int v[10]={1,1,2,3,4,4,4,5,6,6};

//Función llamada inicial
void funcion_moda(int *v, int tam_v, int i, int *moda, int valor_repetido, int n_repeticiones, int n_repeticiones_moda){
	return moda_rec(v,tam_v,0,moda,v[0],1,1);
}

void moda_rec(int *v, int tam_v, int i, int *moda, int valor_repetido, int n_repeticiones, int n_repeticiones_moda){
	if (i<tam_v-1){
		if(v[i] == v[i+1]){
			valor_repetido = v[i];
			n_repeticiones++;
			if (n_repeticiones > n_repeticiones_moda)
				*moda = valor_repetido;
        n_repeticiones_moda = n_repeticiones;
		}
		else
			n_repeticiones = 1;

		moda_rec(v,tam_v,i+1,moda,valor_repetido,n_repeticiones,n_repeticiones_moda);
	}
}

//FUNCIONA
/*
2. Diseña una función recursiva que calcule la i-ésima cifra de un entero n.
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

// (error)
/*
3. Diseña un algoritmo que localice de forma recursiva, en la misma pasada, el
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

//FUNCIONA
/*
4. Diseña un algoritmo que calcule de forma recursiva el producto escalar de dos
vectores de n elementos enteros, n≥0.
*/

//Función llamada inicial
int producto_esc(int *v1, int *v2, int tam_v, int i, int *producto_esc){
	return (v1,v2,tam_v,0,0);
}

int producto_esc_rec(int *v1, int *v2, int tam_v, int i, int *producto_esc){
	if (i<n){
		*producto_esc += v1[i] * v2[i];
		producto_esc_rec(v1,v2,tam_v,i+1,producto_esc);
	}
}


//FUNCIONA
/*
5.- Dado un vector ordenado crecientemente A[1..n], n ≥ 1, diseña un algoritmo que
calcule de forma recursiva la longitud de la escalera más larga, es decir, la longitud
de la secuencia más larga de valores consecutivos que se encuentre en A.
*/

int_escalera(int *v, int tam_v, int i, int escalera_activa, int longitud_esc){
	return (v,tam_v,0,0,0);
}

int escalera_rec(int *v, int tam_v, int i, int escalera_actual, int *longitud_esc){
	if(i<n-1){
		if(v[i] == v[i+1]){
			escalera_actual++;
			if(escalera_actual > longitud_esc)
				longitud_esc = escalera_actual;
		}
		else
			escalera_actual = 0;

		escalera_rec(v,tam_v,i+1,escalera_actual,longitud_esc);
	}
}

//FUNCIONA
/*
6. Diseña una función recursiva que determine si en un vector A de n enteros existen
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


//SIN HACER
/*
7. Diseña un algoritmo que calcule de forma recursiva la suma de todos los elementos
i de un vector A de n enteros que cumplen la siguiente propiedad:
1≤i≤( n 2 )−1:    A[i] > A[2∗i] ∧ A[i] > A[2∗i+1]
*/


//FUNCIONA
/*8. En un vector de enteros se genera un «cambio de tendencia» cuando dada una
secuencia creciente o decreciente de números que ocupan posiciones consecutivas
del vector, el elemento que le sucede es inferior o superior respectivamente. Dado
un vector de N enteros, diseñe una función recursiva que calcule el número de
«cambios de tendencia» que contiene dicho vector.*/

//int v[10]={2,2,3,3,3,1,1,1,1,8}; (3 cambios de tendencia)

/*Función llamada inicial*/
int c_tendencias(int *v, int tam_vec, int i, int *n_cambios){
	c_tendencias_rec(v,tam_vec, 0, 0);
}

int c_tendencias_rec(int *v, int tam_vec, int i, int *n_cambios){
	if (i<n-1){
		if (v[i] < v[i+1] || v[i] > v[i+1])
			*n_cambios++;
		c_tendencias_rec(v,tam_vec, i+1, n_cambios)
	}
}

//SIN HACER
/*
9. Dado un vector de enteros estrictamente positivos A[1..n], n ≥ 1, diseña un
algoritmo que obtenga recursivamente el número de parejas (j,k), 1≤ j ≤ n, 1≤ k ≤ n
tales que i=1∑A[i] hasta j = i=k∑A[i] hasta n.
*/



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
