program SAXPY

  use omp_lib

  implicit none
  integer, parameter :: N=10000000
  integer :: i
  real :: a
  real :: x(N),y(N)
  real :: start,finish
  integer :: nthreads

  !init
  a=1.5
  y=2.0
  call random_number(x)

  START = omp_get_wtime()
  !$omp parallel
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
!Compilar: (usar -fno-automatic  para no limitar el stacksize)
! gfortran -fno-automatic -fopenmp saxpy_omp.f90
