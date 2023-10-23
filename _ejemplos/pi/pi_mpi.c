//#include <cstdlib> // Incluido para el uso de atoi
#include <stdio.h>
#include <stdlib.h>
#include <math.h> 
#include "mpi.h"   // Biblioteca de MPI

#define N 1000000
int main(int argc, char *argv[]) 
{ 
    int n,rank,size; // Numero de procesos
    double PI25DT = 3.141592653589793238462643;
    double mypi;      // Valor local de PI
    double step,x,pi,sum=0.0,sumAll;

    step = 1.0/N;

    //MPI_Init(&argc, &argv);               // Inicializamos los procesos
    MPI_Init(NULL,NULL);               // Inicializamos los procesos
    MPI_Comm_size(MPI_COMM_WORLD, &size); // Obtenemos el numero total de procesos
    MPI_Comm_rank(MPI_COMM_WORLD, &rank); // Obtenemos el valor de nuestro identificador
 
    // Calculo de PI
    sum = 0.0;
    for (int i = rank + 1; i <= N; i += size) {
    	double x = step * ((double)i - 0.5);
    	sum += (4.0/(1.0+x*x));
    }
    //printf("rank: %d,size: %d, sum parcial: %12.10f\n",rank,size,sum);
    // Todos los procesos ahora comparten su valor local de PI,
    // lo hacen reduciendo su valor local a un proceso
    // seleccionada a traves de una operacion aritmetica.
    MPI_Reduce(&sum,         // Valor local de PI
    		&sumAll,     // Dato sobre el que vamos a reducir el resto
    		1,	     // Numero de datos que vamos a reducir
    		MPI_DOUBLE,  // Tipo de dato que vamos a reducir
    		MPI_SUM,     // Operacion que aplicaremos
    		0,           // proceso que va a recibir el dato reducido
    		MPI_COMM_WORLD);   
    MPI_Finalize(); 
    
    pi = step * sumAll;
 
    if ( rank == 0){
       printf("PI=: %12.10f. Error= %12.10f\n",pi,pi - PI25DT);
    }
    printf("sumAll:%12.10f\n",sumAll);
    return 0; 
}
