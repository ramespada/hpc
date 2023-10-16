 program io
 
  implicit none
  integer :: ioerr, inq
  character(len=15) :: nombre="Ramiro", apellido, mensaje
  integer ::  edad=28,altura, peso
  
  namelist/mi_lista/nombre,apellido,altura, peso,mensaje

  !STDIN/STDOUT
   write(*,*) 'Esto es un stdout'
   print*, 'Dame un stdin:'; read(*,*) mensaje
   
  !FMT:
   write(*,'("Mi nombre es:" a8", y tengo" i5 "años."/)') nombre,edad

   print*,"Ingresa tu apellido:"; read(*,'(a10)') apellido
   write(*,'("Mi nombre es:" a8 a8/)') nombre,apellido

 end program
