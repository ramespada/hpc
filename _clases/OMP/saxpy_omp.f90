program SAXPY

  use omp_lib

  implicit none
  integer, parameter :: N=2**18
  real(8):: x(N), y(N)
  real(8):: a,start,finish
  integer :: i, nthreads
  !init
  CALL RANDOM_NUMBER(x)
  y=1.0
  a=2.0

  START = omp_get_wtime()
  !$omp parallel private(i) shared(a,x,y)
  nthreads=omp_get_num_threads()
  !$omp do
  do i=1,N
    y(i) = a * x(i) + y(i)
  enddo
  !$omp end do
  !$omp end parallel
  FINISH = omp_get_wtime()
  print '("Time Avg = ",f15.10," secs. (w/",i0," threads)")',finish-start,nthreads

endprogram
