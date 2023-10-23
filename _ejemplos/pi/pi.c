#include <stdio.h>
#include <stdlib.h>

#define N 10000000

int main(){
   
   double step,x,pi,sum=0.0;

   step=1.0/N;
   for (int i=0;i<N;i++){
   	x=(i+0.5)*step;
   	sum+=4.0/(1.0+x*x);
   }
   pi=step*sum;
   printf("PI=%12.10f\n",pi);

   return 0;
}
