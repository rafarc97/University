#include <stdio.h>
#include <stdlib.h>

int main(){


  int v1[10]  = {1,2,2,1,2,2,2,2,2,1};
  int v2[10]  = {1,2,2,1,2,2,2,2,2,1};

  //SUMA Y MULTIPLICACION VECTORES
  printf("suma = %i\n\nmultiplicacion = %i\n\n",suma(v1,v2,10,0,0),multiplicacion(v1,v2,10,0,0));

  //MODA --- NO FUNCIONA
  /*int v3[10]  = {1,1,2,2,3,3,3,4,5,5};
  int res_moda = 0;
  res_moda = funcion_moda(v3,10,0,0,0,0,0);
  printf("moda = %i",res_moda);
*/

  //2.
  int value = 5;
  values_rec(1,value);

  //3.
  values2_rec(value);

  //6.
  int v[10] = {};
  binary_rec(25,v,0,5);
  printf("Binary of 25 = %i%i%i%i%i\n\n", v[0],v[1],v[2],v[3],v[4]);


  //7.
  printf("Resultado expresión = %i\n\n",expresion_rec(3,0));

  //8. imprimir/leer ¿?
  //9.  imprimir/leer ¿?

  //10.
  printf("Log a = 16 and b = 2 is: %i\n\n", logaritmo_rec(16,2,1,0));

  //11.
  int v4[4] = {};
  alreves_rec(1234,4,0,v);
  printf("El nº 1234 de tam = 1234 al revés es: %i%i%i%i\n\n", v[0],v[1],v[2],v[3]);

  //12.

  return 0;
}

int alreves_rec(int number, int number_size, int count, int *v){
  if(count < number_size){
    v[count] = number % 10;
    alreves_rec(number/10,number_size,count+1,v);
  }
}

int logaritmo_rec(int a, int b, int result, int count){
  if(result * b <= a){
    result *=  b;
    count++;
    logaritmo_rec(a,b,result,count);
  }
  else{
    return count;
  }
}

int expresion_rec(int value, int result){
  if(value >= 1){
    result += value * value;
    expresion_rec(value-1,result);
  }
  else{
    return result;
  }
}

void binary_rec(int value, int *v, int i, int v_size){
  if((value/2) > 0){
      v[i]= value % 2;
      binary_rec(value/2,v,i+1,v_size);
  }
  else if(value /2 == 0){
    v[i]= value % 2;
    int count = 0;
    int temp = 0;
    while(count < v_size/2){
      temp = v[count];
      v[count] = v[v_size - 1 - count];
      v[v_size - 1 - count] = temp;
      count++;
    }
  }
}

void values2_rec(value){
  if (value>=1){
    printf("value nº: %i\n",value);
    values2_rec(value-1);
  }
  else{
    printf("\n");
  }
}


void values_rec(int count, int value){
  if(count<=value){
    printf("value nº: %i\n",count);
    values_rec(count+1,value);
  }
  else{
    printf("\n");
  }
}



int funcion_moda(int *v1, int tam, int i, int moda_final, int moda_actual, int n_repeticiones_final, int n_repeticiones_actual){
  printf("%i",tam);
  return moda_rec(v1,10,0,0,0,0,0);
}

int moda_rec(int *v1, int tam, int i, int moda_final, int moda_actual, int n_repeticiones_final, int n_repeticiones_actual){
  if(i<tam-1){
      if(v1[i] == v1[i+1]){
        moda_actual = v1[i];
        n_repeticiones_actual++;
        if(n_repeticiones_actual > n_repeticiones_final){
          n_repeticiones_final = n_repeticiones_actual;
          moda_final = moda_actual;
        }
      }
      else{
        n_repeticiones_actual = 0;
      }
      moda_rec(v1,tam,i,moda_final,moda_actual,n_repeticiones_final,n_repeticiones_actual);
  }
  else
    return moda_final;
}

int suma(int *v1, int *v2, int tam, int i, int suma){
  return suma_rec(v1,v2,10,0,0);
}

int suma_rec(int *v1, int *v2, int tam, int i, int suma){
  if (i<tam){
    suma += v1[i] + v2[i];
    suma_rec(v1,v2,tam,i+1,suma);
  }
  else{
    return suma;
  }
}

int multiplicacion(int *v1, int *v2, int tam, int i, int multiplicacion){
  return multiplicacion_rec(v1,v2,10,0,0);
}
int multiplicacion_rec(int *v1, int *v2, int tam, int i, int multiplicacion){
  if(i<tam){
    multiplicacion += v1[i] * v2[i];
    multiplicacion_rec(v1,v2,tam,i+1,multiplicacion);
  }
  else
    return multiplicacion;
}
