program saxpy
  implicit none
  integer, parameter :: N=10000000
  integer :: i
  real :: a
  real :: x(N),y(N)

  a=1.5
  y=2.0
  call random_number(x)

  do i=1,N
   y(i)=a*x(i) + y(i)
  enddo
  !y= a*x + y 

endprogram
