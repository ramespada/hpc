program hola
    implicit none
    integer :: ierr,ntasks,rank,len
    character(50) :: hostname

    include 'mpif.h'

    call MPI_INIT(ierr)
        call MPI_COMM_SIZE(MPI_COMM_WORLD,ntasks,ierr)
        call MPI_COMM_RANK(MPI_COMM_WORLD,rank  ,ierr)
        call MPI_GET_PROCESSOR_NAME(hostname, len ,ierr)
        print '("Hola mundo! (proc: ",I0," de ",I0,") en: ",20A )',rank,ntasks,hostname
    call MPI_FINALIZE(ierr)

end program
!!Para correrlo:
!! >> mpif90 hola_mpi.f90
!! >> mpirun -np 4 a.out
