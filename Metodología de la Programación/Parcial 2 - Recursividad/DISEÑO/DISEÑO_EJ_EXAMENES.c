#include <stdio.h>
#include <stdlib.h>

int main(){

  //1.
  int v[10] = {1,1,2,3,4,4,4,5,5,6};
  printf("\nLa moda es %i\n",moda_rec(v,10,0,0,v[0],0));

  //2.
  int n = 123421, i = 4;
  printf("\nLa cifra %i de %i es %i\n",i,n,iesima_rec(n,i,0));

  //3.
  int max = v[0], min = v[0];
  maxmin_rec(v,10,&max,&min);
  printf("\nEl máximo es %i y el minimo es %i\n",max,min);


  return 0;
}


/*
1.- Dado un vector A de n enteros ordenado crecientemente, diseñe una función
recursiva que devuelva su moda, es decir, el valor más frecuente de A.
*/

//int v[10] = {1,1,2,3,4,4,4,5,5,6};

int moda_rec(int *v, int tam, int i, int n_reps, int moda, int n_reps_moda){
  //caso base
  if(i>tam-1){
    return moda;
  }
  //caso general
  else{
    if(v[i] == v[i+1]){
      n_reps++;
      if(n_reps > n_reps_moda){
        moda = v[i];
        n_reps_moda = n_reps;
      }
      return moda_rec(v,tam,i+1,n_reps,moda,n_reps_moda);
    }
    else{
      n_reps = 0;
      return moda_rec(v,tam,i+1,n_reps,moda,n_reps_moda);
    }
  }
}

/*
2.- Diseña una función recursiva que calcule la i-ésima cifra de un entero n.
*/

int iesima_rec(int n, int i, int iesima){
  //caso base
  if(i == 1){
    return n%10;
  }
  //caso general
  else{
    return iesima_rec(n/10,i-1,iesima);
  }
}


/*
3.- Diseña un algoritmo que localice de forma recursiva, en la misma pasada, el
máximo y el mínimo de un vector dado no vacío.
*/

void maxmin_rec(int *v, int tam, int *max, int *min){
  //caso general
  if (tam>=0){
    if(v[tam] > *max)
      *max = v[tam];
    if(v[tam] < *min)
      *min = v[tam];
    maxmin_rec(v,tam-1,max,min);
  }
}
