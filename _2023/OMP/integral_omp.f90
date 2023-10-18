program integral
 !Calcular la integral de f(x)=4/(1+x*x) entre 0 y 1 (es == PI)
 use omp_lib
 implicit none
 DOUBLE PRECISION START, FINISH
 integer, parameter :: num_steps=10000000
 integer :: i,nthreads
 real    :: step,x,pi,sum=0.0

 step=1.0/num_steps
 
 START = omp_get_wtime() 
 !$OMP PARALLEL private(x)
 nthreads=omp_get_num_threads()
 !$OMP DO REDUCTION(+:sum) 
 do i=1,num_steps
    x=(i+0.5)*step
    sum=sum+4.0/(1.0+x*x)
 enddo
 !$OMP END DO
 !$OMP CRITICAL
 pi=step*sum
 !$OMP END CRITICAL
 !$OMP END PARALLEL
 FINISH = omp_get_wtime() 

 print '("PI= ",f12.10," in ",f12.10," secs. (w/ ",I0," threads).")',pi,finish-start,nthreads
end program

!Correr:
!for i in $(seq 1 10);do export OMP_NUM_THREADS=$i;./integral;done
