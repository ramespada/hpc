program integral
 !Calcular la integral de f(x)=4/(1+x*x) entre 0 y 1 (es == PI)
 implicit none
 integer, parameter :: N=10000000
 double precision :: step,x,pi,sum=0.0
 integer :: i

  step=1.0/N
  do i=1,N
    x=(i+0.5)*step
    sum=sum+4.0/(1.0+x*x)
  enddo
  pi=step*sum
  print '("PI= ",f12.10)',pi
end program
