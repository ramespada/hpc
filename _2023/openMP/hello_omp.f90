program hola

  use omp_lib
  implicit none

  !$omp parallel
  print '("Hello world! ",I0,"/",I0)',omp_get_thread_num(),omp_get_num_threads()
  !$omp end parallel

end program

!!Para correrlo:
!! >> gfortran -fopenmp hello_omp.f90
!! >> mpirun -np 4 a.out
