---
layout: lecture
date: 2023-01-02
title: C
description: Lenguaje de programación C.
ready: true
---

> C es un lenguaje de programación de propósito general originalmente desarrollado por Dennis Ritchie entre 1969 y 1972 en los Laboratorios Bell, como evolución del anterior lenguaje B, a su vez basado en BCPL. Al igual que B, es un lenguaje orientado a la implementación de sistemas operativos, concretamente Unix.

## Hola mundo!

Para escribir un programa en C, se crea un archivo de texto con extensión **``.c``** con cualquier editor de texto y adentro se escribe el programa, por ejemplo:

```c 
#include <stdio.h>
int main()
{
	printf("Hola mundo!\n");
	return 0;
}
```

## Compilación y ejecución

Para compilar un programa escrito en C (usando ```gcc```), se escribe en la terminal:
```
gcc 00holamundo.c
```

se va a crear un ejecutable con nombre  ```a.out```, para ejecutarlo:
```
./a.out
```

si se desea que el ejecutable tenga otro nombre se escribe: ``` gcc 00holamundo.c -o mi_programa.exe ```

## Estructura
Esta es la estructura general de un progama en C:

```c 
#include <stdio.h>
#include <string.h>
// esto es un comentario
/* esto es un comentario 
   multi-linea
*/

//definicion de constantes simbolicas
#define a 10
#define saludo "Hola"

//variables externas/globales
int b=1;

//subrutinas y funciones
void ask(){
        printf("Cual es tu nombre? ");	//stdout
}

// funcion main 
int main(){
           
        //Declaracion de variables:
        char nombre[10] = "estimado";
	
	//Instrucciones del programa:
        ask();
	scanf("%s",nombre);		//stdin
        
	printf("Hola %s! Como va?\n",nombre);
        
   	return 0;	
}
```

con ``#include `` se llaman a modulos ó librerias externas que posibilitan el uso de funciones y subrutinas especificas para el distintos usos.
Entre las más utilizadas se encuentran:
```c 
#include <stdio.h>	//input / output
#include <stdlib.h>	//
#include <math.h>	//aritmetica
#include <string.h>	//strings
```

## *Datatypes*

Los tipos de datos básicos en C son:
+ Enteros (``int``)
+ Punto flotante  (`` float ``)
+ Caracter y strings (`` char ``)

Con `int` se representan numeros enteros, e incluso variables lógicas ó *booleanos* (tipo true ó false, donde 0=false y 1=true).

Se definen ` int nombre_variable;` y se pueden realizar opreaciones lógicas (sólo utilizando 0 y 1), operaciones relacionales, operaciones aritméticas e intrínsecas.

```c 
int p,q;

//	op. logicas
p=0;
q=1;

printf("     p = %d\n",p);
printf("     q = %d\n",q);
printf("    !p = %d\n",!p);
printf(" p & q = %d\n",p&q);
printf(" p | q = %d\n",p|q);
printf("p == q = %d\n",p==q);
printf("p != q = %d\n",p!=q);

//	op. relacionales
int n=-3,m=7;

printf("     n = %d\n",n);
printf("     m = %d\n",m);
printf("n == m = %d\n",n==m);
printf("n != m = %d\n",n!=m);
printf("n <  m = %d\n",n< m);
printf("n <= m = %d\n",n<=m);
printf("n >  m = %d\n",n> m);
printf("n >= m = %d\n",n>=m);

//	op. aritmeticas
printf("n + m = %d\n",n+m);
printf("n / m = %d\n",n/m);
printf("n %% m = %d\n",n%m);

//	op. intrinsecas
printf("Op. intrinsecas:\n");
printf("abs(n) = %d\n",abs(n));
```

Con `float` se representan los números "reales" (de precisión finita), se definen `float mi_variable;` y sirven para hacer opraciones artiméticas y operaciones intrinsecas más complejas.

```c
float x, y;
x=1.2e-1;
y=-2.78;

// op. aritméticas
printf("    x = %6.2f\n",x);
printf("    y = %7.3f\n",y);
printf("x - y = %7.3f\n",x-y);
printf("x * y = %7.3f\n",x*y);

// op. intrínsecas
double xx, yy;
xx=1.2e-1;
yy=-2.78;
printf("pow(x,y) = %7.3f\n",pow(x,y));
printf("sqrt(x) = %7.3f\n",sqrt(xx));
printf("exp(x) = %7.3f\n",exp(xx));
printf("log(x) = %7.3f\n",log(xx));
printf("sin(x) = %7.3f\n",sin(xx));
printf("cos(x) = %7.3f\n",cos(xx));
```

Con `char` se pueden representar letras y palabras.

```c
	char* letra = "a";
	char str1[14]="asdasd asddsa";

	printf("Esto es una letra %s\n",letra);
	printf("Esto es un string %s\n",str1);

/*
	char c;
	c = getchar();
	putchar(c);
        
         character*30       :: str1="Esto es un string       "
         character (len=30) :: str2=", este es otro string.  "
  
         print*, str1
         
         !Operaciones con CHARACTER:
         print*, str1(9:25)
         print*, str1//str2
         print*, trim(str1)//trim(str2)
  
         print*, len(str1)
         print*, len(trim(str1))

         print*, repeat(str2(11:15),4)
         
         print*, scan(str1, 'aeiou')
         print*, index(str2, 'otro',back=.true.)
         print*, verify(str1,'Esto es un strang')
*/
   	char srcString[40];
   	char destString[100];
  
   	memset(destString, '\0', sizeof(destString));
   	strcpy(srcString, "Este es un string");
   	strcpy(destString, srcString);
   	printf("String resultante: %s\n", destString);
```


Se pueden realizar también conversión de variables a distintos datatypes:

```c
// Type conversion:
/* bool -> char -> short int -> int -> unsigned int -> long -> unsigned -> long long -> float -> double -> long double 	*/
// char to int
char a[1] = "j";
int i= atoi(a);
printf("letra: %s; int %d\n", a, atoi(a));
```

## Input / Output

Los standard input/output (abreviados: stdin/stdout), son las formas más símples de transferencia de información entre la computadora y el usuario.

El *stdin* es el que está vinculado a las entradas que damos desde la consola con nuestro teclado. En C el ingreso de stdinput se reclama con la función `scanf`:
```c
 scanf(fmt, &variable);
```
donde el primer atributo (*fmt*) es un string que representa la forma ó formato de la variable a leer, y el segundo atributo es la variable donde se va a guardar la entrada.

El formato puede tener la siguientes formas:

|--------|--------  |---------- |---------------------|
| fmt    | datatype | ejemplo   |  descripción        |  
|------- | -------- | --------  |---------------------|
|  %nd   | `int`    | `'%6d' `  | entero con *n* digitos |
|  %n.mf | `float`  | `'%7.2f'` | punto flotante con *n* digitos y *m* decimales | 
|  %c    | `char`   | `'%c'`    | letra                  |
|  %ns   | `string` | `'%10s'`  | string de longitud *n* |


La forma mas simple de retornar informacion es el *stout*, que serian los mensajes que aparecen en consola. Para mandar cosas al stout podemos usar:

```c
	printf(fmt, mensaje_a_mostrar);
```

donde *fmt* es el formato (de la misma forma que para `scanf`), y el segundo atributo es el mensaje ó valor a mostrar en pantalla.



```c 
#include <stdio.h>
#include <string.h>

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

   return 0;   
}
```


## Controladores (Condicionales y Loops)

El condicional más utilizado es *if .., else.* 
```c 
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
``` 

Otra forma de aplicar condicionales es mediante switches (case):
```c 
   switch( signo ){
	   case '+':
         printf( "x es positivo\n");
	   case '-':
         printf( "x es negativo\n");
	   default:
         printf( "x es cero\n");
   }
   */
``` 

Para realizar iteraciones (loops), se puede utilziar la estructura *for*

```c 
   int i=0;
   for (i=0;i<10;++i){

	printf("%3d\n",i);
   }
```
Otra forma de loop es *while*:
```c
   while (i>0){

	printf("%3d\n",i);
   	--i;
   } 
```

## Funciones y subrutinas:

Las **funciones** se definen:
```c 
float suma(float arg1, float arg2){
	return arg1 + arg2;
}
 
```

Las ** subrutinas ** son funciones que cuyo dominio es vacío, por lo que no retornan ningún valor:
```c
void suma2(float arg1, float arg2, float *arg3) {
	 *arg3=arg1+arg2;
}

``` 

Para llamar a funciones y subrutinas en la función main:
```c
int main(){
	float a, b, c;
        a=1.;
        b=2.;
        c=0.;
        
	printf("%4f + %4f  = %4f\n",a,b,suma(a,b));
               
        suma2(a,b,&c);
	
	printf("%4f\n",c);
 
	return 0;	
}
```


## Modulos:
```c 
#include<stdio.h>
#include "06mod_ext.h"

int main(){
	
	float r=1.23000;
	printf("pi=%f\n", pi);
	printf("area=2*pi*r*r=%f\n", area(r));

	return 0;
}
```



## Input / Output II
```c 
#include <stdio.h>
#include <stdlib.h>

int main(){

   //open / write/ close file
   FILE *fp=fopen("asa.txt","rw");
   char buffer[255];

   fp = fopen("test.txt", "w+");
   fprintf(fp, "Dejo un mensaje...\n");
   fclose(fp);

   //read
   fp = fopen("test.txt", "r");
   fscanf(fp, "%s", buffer);   printf("1 : %s\n", buffer );
   fgets(buffer, 255, (FILE*)fp);   printf("2: %s\n", buffer );
   fclose(fp);

   return 0;
}
```


## Arrays:
```c 
#include <sdtio.h>

int main(){

	int n[3]={0,  3 , -2};
	float v[3]={0.001, -3.12, 15.0 }

	float A[3][3]={ 1.0, 0.0, 0.0,
	       		0.0, 2.0, 0.0,
		       	0.0, 0.0 ,3.0}

	return 0;
}
/*
   
   character(len=20), dimension(5) :: frutas
   integer :: n(3)
   real    :: v(3)
   real    :: A(3,3)
   integer :: i
   
   !Acceso y asignacion de valores:
   frutas(1)='manzana'
   frutas(2)='banana'
   frutas(4)='kiwi'
           
   print*, frutas
   print*, frutas(4)
   print*, frutas(2:4)
   
   !loops:
   do i=1,3,1
           v(i)=i*0.45
   end do
   print*, v
   !loops implicitos
   n=(/ (i,i=1,9,3) /)
   print*,n
   v=(/ (i,i=1, 3,1)  /)*0.45
   print*, v
   v=(/ (i*0.45,i=1, 3,1)  /)  !otra forma
   print*, v
   
   A= 0.                       !todos ceros
   print*,"Nula:"
   write(*,'(3(f8.2))') A
   
   print*, "Identidad:"
   A(1,:)=(/ 1.0, 0.0, 0.0 /)
   A(2,:)=(/ 0.0, 1.0, 0.0 /)
   A(3,:)=(/ 0.0, 0.0, 1.0 /)
   write(*,'(3(f8.2))') A
   
   print*, "Matriz A:"
   A = reshape((/(i*0.25,i=1,size(A))/), shape(A))
   write(*,'(3(f8.2))') A
   
   !Aritmética + - * /   (entre aquellos de misma forma!!)
   print*,'A+A' 
   write(*,'(3(f8.2))') A+A
   print*,'A*A'
   write(*,'(3(f8.2))') A*A
   
   !Intrinsecos a arrays:
   print*,'sum(A)', sum(A)
   print*,'product(A)',product(A)
   
   print*,'size(A)', size(A)
   print*,'shape(A)',shape(A)
   
   print*,'lbound(A)',lbound(A)
   print*,'ubound(A)',ubound(A)
   
   print*,'minval(A)',minval(A)
   print*,'maxval(A)',maxval(A)
   print*,'minloc(A)',minloc(A)
   print*,'maxloc(A)',maxloc(A)
   
   !Operaciones relacionales
   print*,'all(A<0.3)',all(A<0.3)
   print*,'any(A<0.6)',any(A<0.6)
   print*,'count(A>0.4)',count(A>0.4)
*/
```


## Memoria y punteros

```c 
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
```


## Estructuras

Unaestructura es una colección de una ó más variables agrupadas bajo el mismo nombre. Son una buena herramienta para organizar datos complejos

```c

// Definición de estructura "punto"
struct punto{
	int x;
	int y;
};

// Definción de estructura "rectangulo"
struct rect{
	struct punto pt1;
	struct punto pt2;
};

```

Para llamar a una variable dentro de una estructura la sintaxis es:

```c
struct rect pantalla;

printf("Vertice de pantalla: (%d,%d)", pantalla.pt1.x, pantalla.pt1.y)
```


Es posible definir funciones sobre estructuras:

```c
struct punto makePoint(int x, int y){
	struct point temp;
	temp.x=x;
	temp.y=y;
	return temp;
};

```
