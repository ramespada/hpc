#include <stdio.h>
#include <string.h>
/*
Format:
	%d (decimal)	ej: %6d
	%f (float)	ej: %7.2f
	%c (char)	ej: %c
	%s (string)	ej: %10s
*/

int main(){
  
  char nombre[15] ="jose";
  char apellido[15], mensaje[15];
  int edad=28;
  float altura=1.65, peso=63;

  //STDIN/STDOUT
   printf("Esto es un stdout\n");
   printf("Dame un stdin: "); scanf("%15s",mensaje);
   
  //FMT:
   printf("Mi nombre es: %8s, y tengo %5d años y peso %5.2f.\n", nombre, edad,peso);
   printf("Ingresa tu apellido:"); scanf("%8s",apellido);
   printf("Mi nombre es: %8s %8s\n", nombre,apellido);


   //otras funciones menos generales:
   //
   char letra;
   char cadena[10];

   printf("Dame una letra..");
   letra=getchar();
   putchar(letra);
   
   printf("Ahora un string..");
   gets(cadena);
   puts(cadena);

   return 0;   
}

