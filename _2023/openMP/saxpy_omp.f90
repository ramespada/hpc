program SAXPY

  use omp_lib

  implicit none
  integer, parameter :: N=2**10
  real :: x(N), y(N)
  real :: a,start,finish
  integer :: i,np
  !init
  CALL RANDOM_NUMBER(x)
  y=1.0
  a=2.0

  START = omp_get_wtime()
  !$OMP PARALLEL
  !$OMP DO
  do i=1,size(x)
    y(i) = a * x(i) + y(i)
  enddo
  !$OMP END DO
  np=omp_get_num_threads()
  !$OMP END PARALLEL
  FINISH = omp_get_wtime()
  print '("Time Avg = ",f12.8," seconds. w/",i0,"threads")',finish-start,np 

endprogram
