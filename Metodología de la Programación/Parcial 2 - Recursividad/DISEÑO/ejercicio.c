#include <stdio.h>
#include <stdlib.h>
#include <math.h>



int main()
{
  int i;
  int v[10] = {2,3,4,5,6,7,8,9,10,11};
    primos_rec(v,10,0,1);

    for (i = 0; i < 10; i++){
    printf("%i",v[i]);
  }
}


void primos_rec(int v[], int tam, int i, int j){
  if(i < tam){
    if (j < tam - 1){
      if(v[i] != 0 && v[j] % v[i] == 0){
        v[j] = 0;
      }
      primos_rec(v,tam,i,j+1);
    }
    primos_rec(v,tam,i+1,i+2);
  }
}
