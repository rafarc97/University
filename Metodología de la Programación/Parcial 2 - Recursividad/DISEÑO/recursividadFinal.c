#include <stdio.h>
#include <stdlib.h>

int funcion_suma(int num1, int num2, int resultado);
int funcion_producto(int num1, int num2, int resultado);
int funcion_factorial(int num, int resultado);

int main(){


int resultado_suma = funcion_suma(8,9,0);
printf("La suma es: %i\n", resultado_suma);

int resultado_producto = funcion_producto(7,4,0);
printf("El producto es: %i\n", resultado_producto);

int resultado_factorial = funcion_factorial(5,1);
printf("El resultado del factorial es %i\n", resultado_factorial);

return 0;

}

int funcion_suma(int num1, int num2, int resultado){

	if(num1 == 0)
		return resultado + num2;
	else
		return funcion_suma(num1 - 1, num2, resultado + 1);
}


int funcion_producto(int num1, int num2, int resultado){

	if(num2 == 1)
		return num1 + resultado;
	else
		return funcion_producto(num1, num2 - 1, resultado + num1); 
}

int funcion_factorial(int num, int resultado){

	if(num == 0)
		return 1 * resultado;
	else
		return funcion_factorial(num - 1, resultado * num);
}
