#include <stdio.h>
#include <stdlib.h>	
#include <math.h>	//aritmetica
#include <string.h>	//strings

#define PI 3.14 	//constantes simbólicas, reemplaza PI por 3.14

int main(){

	printf("PI=%f\n",PI);

	//integers
	printf("INTEGERS:\n");
	printf("---------\n");
	//	op. logicas
	printf("Op. lógicas:\n");
	int p,q;
	
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
	printf("Op. relacionales:\n");
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
	printf("Op. artimeticas:\n");
	

	printf("n + m = %d\n",n+m);
	printf("n / m = %d\n",n/m);
	printf("n %% m = %d\n",n%m);
	
	//	op. intrinsecas
	printf("Op. intrinsecas:\n");
	printf("abs(n) = %d\n",abs(n));

	//FLOAT
	printf("FLOATING POINT:\n");
	printf("---------------\n");

	float x, y;
	x=1.2e-1;
	y=-2.78;

	printf("    x = %6.2f\n",x);
	printf("    y = %7.3f\n",y);
	printf("x - y = %7.3f\n",x-y);
	printf("x * y = %7.3f\n",x*y);
	
	double xx, yy;
	xx=1.2e-1;
        yy=-2.78;
	printf("pow(x,y) = %7.3f\n",pow(x,y));
	printf("sqrt(x) = %7.3f\n",sqrt(xx));
	printf("exp(x) = %7.3f\n",exp(xx));
	printf("log(x) = %7.3f\n",log(xx));
	printf("sin(x) = %7.3f\n",sin(xx));
	printf("cos(x) = %7.3f\n",cos(xx));

	//Character
	printf("CHARACTER / STRING:\n");
	printf("-------------------\n");

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

	// Type conversion:
	/* bool -> char -> short int -> int -> unsigned int -> long -> unsigned -> long long -> float -> double -> long double 	*/
	// char to int
	char a[1] = "j";
	int i= atoi(a);
	printf("letra: %s; int %d\n", a, atoi(a));



  return 0;
}
