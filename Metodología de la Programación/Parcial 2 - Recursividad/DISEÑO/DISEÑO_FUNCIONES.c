#include <stdio.h>
#include <stdlib.h>

int main(){

  //MODA
  int v[10]={1,1,2,3,4,4,4,5,6,6};
  int moda = 0;
  funcion_moda(&v,10,0,&moda,0,0,0);

  printf("\nLa moda es: %i\n\n",moda);

  //IESIMA
  int iesima_cifra = iesima(23456,3);
  printf("La iésima cifra es: %i\n\n", iesima_cifra);

  //MAXMIN
  int v2[10]={2,5,3,8,9,1,0,3,2,4};
	int maximo=0, minimo=v2[0];
	maxmin(v2,10,&maximo, &minimo);
  printf("El max es %i y el min es %i\n\n", maximo, minimo);


  //PRODESCALAR
  int v3[10]={2,2,2,2,2,2,2,2,2,3};
  int v4[10]={2,2,2,2,2,2,2,2,2,2};
  int producto = 0;
  producto = producto_esc(v3,v4,10,0,&producto);
  printf("producto = %i\n\n", producto);

  int v5[10]={2,1,2,1,2,1,2,8,2,3};
  int longitud = 0;
  longitud = escalera(v5,10,0,0,0);
  printf("longitud escalera: %i\n\n", longitud);

  //SUMAS PAREJAS
  int v6[10]={2,2,2,1,2,3,2,8,2,3};
  if(sumas(v6,10) == 1)
    printf("SI existe esa pareja\n\n");
  else
    printf("NO existe esa pareja\n\n");


  //TENDENCIAS
  int v7[10]={2,2,2,1,2,3,2,8,2,3};
  int n_cambios = 0;
  printf("nº cambios = %i\n\n", c_tendencias(v7,10,n_cambios));

  //SUMATORIO


  return 0;
}

//parejas_rec(v,10,0,)
int parejas_rec(int *v, int tam, int i, int j, int k){
  if(j == k){

  }
  else{
    
  }
}


int c_tendencias(int *v, int tam_vec, int i, int n_cambios){
	return c_tendencias_rec(v,tam_vec, 0, 0);
}

int c_tendencias_rec(int *v, int tam_vec, int i, int n_cambios){
	if (i<tam_vec-1){
		if (v[i] < v[i+1] || v[i] > v[i+1])
			n_cambios++;
		c_tendencias_rec(v,tam_vec, i+1, n_cambios);
	}
  else{
    return n_cambios;
  }
}

int sumas(int* v, int n)
{
	 return sumas_rec(v,n,0);
}

int sumas_rec(int* v, int n, int i)
{
	if(i>n-4)
		return 0;
	else
	{
		if(v[i]+v[i+1]==v[i+2]+v[i+3])
			return 1;
		else
			sumas_rec(v,n,i+1);
	}
}


int escalera(int *v, int tam_v, int i, int escalera_activa, int longitud_esc){
	return escalera_rec(v,tam_v,0,0,0);
}

int escalera_rec(int *v, int tam_v, int i, int escalera_actual, int longitud_esc){
	if(i<tam_v-1){
		if(v[i] == v[i+1]){
			escalera_actual++;
			if(escalera_actual > longitud_esc)
				longitud_esc = escalera_actual;
		}
		else
			escalera_actual = 0;

		escalera_rec(v,tam_v,i+1,escalera_actual,longitud_esc);
	}
  else
    return longitud_esc+1;
}

//Función llamada inicial
int producto_esc(int *v1, int *v2, int tam_v, int i, int producto_esc){
	return producto_esc_rec(v1,v2,tam_v,0,0);
}

int producto_esc_rec(int *v1, int *v2, int tam_v, int i, int producto_esc){
	if (i<tam_v){
		producto_esc += v1[i] * v2[i];
		producto_esc_rec(v1,v2,tam_v,i+1,producto_esc);
	}
  else{
      return producto_esc;
  }
}


//Función llamada inicial
int funcion_moda(int *v, int tam_v, int i, int *moda, int valor_repetido, int n_repeticiones, int n_repeticiones_moda){
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

int iesima(int n, int i)
{
	if(i==1) //caso base
		return n%10;
	else //caso general
	{
		return iesima(n/10, i-1);
	}
}


void maxmin(int v[], int tam, int* max, int* min)
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
