#include <stdio.h>
#include <stdlib.h>

#define N 10000000

int main(){
    float a=1.5;
    float x[N],y[N]; //a,*y;

    for (int i=0;i<N;i++){
	x[i]=rand();
        y[i]=2.0;
     };

    for(int i=0; i<N; i++){
    	y[i]=a*x[i]+y[i];
    }
  

    return 0;
}

