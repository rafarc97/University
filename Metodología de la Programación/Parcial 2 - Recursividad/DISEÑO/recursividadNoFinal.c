#include <stdio.h>
#include <stdlib.h>

int funcion_suma(int num1, int num2);
int funcion_producto(int num1, int num2);
int funcion_factorial(int num);

int main(){


int resultado_suma = funcion_suma(8,9);
printf("La suma es: %i\n", resultado_suma);

int resultado_producto = funcion_producto(7,4);
printf("El producto es: %i\n", resultado_producto);

int resultado_factorial = funcion_factorial(5);
printf("El resultado del factorial es %i\n", resultado_factorial);

return 0;

}

int funcion_suma(int num1, int num2){

	if(num2 == 0)
		return num1;
	else
		return 1 + funcion_suma(num1, num2 - 1);
}


int funcion_producto(int num1, int num2){

	if(num2 == 1)
		return num1;
	else
		return num1 + funcion_producto(num1, num2 - 1); 
}


int funcion_factorial(int num, int resultado){

	if(num == 0)
		return 1;
	else
		return num * funcion_factorial(num - 1);
}
