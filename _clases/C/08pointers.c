#include <stdio.h>



void swap(int *x, int *y){
	int temp;
	
	temp=*x;
	*x=*y;
	*y=temp;
}




int main () {

   int  var = 20;   /* actual variable declaration */
   int  *ip;        /* ip es un pointer */

   ip = &var;       /* guardo adress de var en ip*/

   printf("Valor de var: %d\n", var  );
   printf("Address de var: %x\n", &var  );

   /* address stored in pointer variable */
   printf("Address guardada en la variable ip: %x\n", ip );

   /* access the value using the pointer */
   printf("Value de *ip: %d\n", *ip );		// cuando aplico * a un pointer, retorna el valor guardado en el adress que guarda el pointer



	int a=2,b=3;
	printf("a=%d, b=%d\n",a,b);
	swap(&a,&b);
	printf("a=%d, b=%d\n",a,b);


   return 0;
}
