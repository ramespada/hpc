#include <stdio.h>

__global__ void hola_cuda(){
      printf("Hello World from GPU!\n");
}

int main() {
      //no hace absolutamente nada, pero no deberia dar error.
      hola_cuda<<<1,1>>>();
 
      return 0;
}
// Compilación:
// $ nvcc hola_cuda.cu
// Ejecución:
// $ ./a.out
