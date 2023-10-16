 program io
 
  implicit none
  integer :: ioerr, inq
  character(len=15) :: nombre="Ramiro", apellido, mensaje
  integer ::  edad=28,altura, peso
  
  namelist/mi_lista/nombre,apellido,altura, peso,mensaje

  !OPEN / CLOSE
   open(unit=1,FILE="archivo.txt",STATUS="NEW",ACTION="WRITE")
   write(1,*) "Hola, ..dejo este mensaje."
   close(1)
  
  !READ / WRITE
   open(unit=2,file="archivo.txt",STATUS="OLD",ACTION="READWRITE")
   read(unit=2,FMT='(a20)') mensaje
   write(2,'(a20/)') mensaje
   close(2)

  !NAMELISTS
   open(unit=3,file="mi_namelist.inp")
   read(3, mi_lista)
   close(3)
          
  write(*,'("Nombre:"2(a8)/"Edad:"i4/"Altura:"i4/"Peso:"i6/"Mensaje &       
        :"a30/)') nombre,apellido,edad,altura,peso,mensaje

  !INQUIRE  (para obtener info sobre el archivo a leer)
  ! puede ser llamado por nombre de archivo ó por unidad:
  inquire(file='data.txt',exist=inq);print*,"Existe data.txt?",inq
  inquire(unit=1,opened=inq); print*,"Esta abierto UNIT=1?",inq
   
 end program
