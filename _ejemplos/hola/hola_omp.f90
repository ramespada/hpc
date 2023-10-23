program hola

  use omp_lib
  implicit none

  !$omp parallel
  print '("Hello world! ",I0,"/",I0)',omp_get_thread_num(),omp_get_num_threads()
  !$omp end parallel

end program

! Compilación:
! $ gfortran -fopenmp hola_omp.f90
! Ejecución:
! export OMP_NUM_THREADS=4
! ./a.out
