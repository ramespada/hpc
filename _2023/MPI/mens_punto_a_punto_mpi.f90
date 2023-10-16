program hola
    implicit none
    integer :: ierr,status,ntasks,rank,tag,len
    integer :: dest,source, mens
    character(50) :: hostname

    include 'mpif.h'

    call MPI_INIT(ierr)
        call MPI_COMM_SIZE(MPI_COMM_WORLD,ntasks,ierr)
        call MPI_COMM_RANK(MPI_COMM_WORLD,rank  ,ierr)
        call MPI_GET_PROCESSOR_NAME(hostname,len,ierr)

        print '("Hola mundo! (",I0,"/",I0,"), en: ",20A )',rank,ntasks,hostname
        if ( rank == 0 ) then
           dest=1
           mens=8 !rank  !"Hola, te mando un mensaje desde el proc. 1"
           call mpi_send(mens, 1, MPI_INTEGER,   dest, tag, MPI_COMM_WORLD, ierr)
        else if ( rank == 1 ) then
           source=0
           call mpi_recv(mens, 1, MPI_INTEGER, source, tag, MPI_COMM_WORLD, status, ierr)
           print '("Recibí un  mensaje que dice: (",I0,")" )', mens
           print*, mens
        endif
    call MPI_FINALIZE(ierr)

end program
!!Para correrlo:
!! >> mpif90 hola_mpi.f90
!! >> mpirun -np 4 a.out
