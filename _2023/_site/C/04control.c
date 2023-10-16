#include <stdio.h>
int main(){
   float x=10;
   char signo;
   //CONDICIONALES (IF,ELSE,ELSE IF)
   if (x>0){ 
             printf( "x es positivo\n");
	     signo = "+";
   }
   else if (x<0) {
             printf( "x es negativo\n");
	     signo = "-";
   }
   else{
             printf( "x es cero\n");
	     signo = "0";
   }

   /*// SWITCHES (CASE)
   switch( signo ){
	   case '+':
         printf( "x es positivo\n");
	   case '-':
         printf( "x es negativo\n");
	   default:
         printf( "x es cero\n");
   }
   */

   //FOR
   int i=0;
   for (i=0;i<10;++i){

	printf("%3d\n",i);
   }

   //WHILE
   while (i>0){

	printf("%3d\n",i);
   	--i;
   } 
   
   return 0;
}
