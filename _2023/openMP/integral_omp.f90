program integral
 !Calcular la integral de f(x)=4/(1+x*x) entre 0 y 1 (es == PI)
 use omp_lib
 implicit none
 DOUBLE PRECISION START, FINISH
 integer, parameter :: num_steps=100000
 integer :: i
 real    :: step,x,pi,sum=0.0

 step=1.0/num_steps
 
 START = omp_get_wtime() 
 !$OMP PARALLEL private(x)
 !$OMP DO REDUCTION(+:sum) 
 do i=1,num_steps
    x=(i+0.5)*step
    sum=sum + 4.0/(1.0+x*x)
 enddo
 !$OMP END DO
 !%OMP CRITICAL
 pi=step*sum
 !$OMP END PARALLEL
 FINISH = omp_get_wtime() 
 print '("PI= ",F12.10," in ",F12.10," seconds.")',pi,finish-start
end program
