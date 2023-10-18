       PROGRAM datatypes
        implicit none
        
        logical  :: p, q=.TRUE.
        
        !Inicialización
        p=.FALSE.
        
        print*,'p: ',p
        print*,'q: ',q
        
        !Operaciones LOGICAS:
        print*,  .NOT. p
        print*,  p .AND.  q
        print*,  p .OR.   q
        print*,  p .EQV.  q
        print*,  p .NEQV. q  !XOR

       END PROGRAM datatypes
	PROGRAM datatypes
	   implicit none
	   integer :: n=7,m
	   
           m=3

	!Operaciones con INTEGER
	!Relacionales (retorna LOGICAL)
           print*, n == m  ! .EQ.
	   print*, n /= m  ! .NE.
	   print*, n <  m  ! .LT.
	   print*, n <= m  ! .LE.
	   print*, n >  m  ! .GT.
	   print*, n >= m  ! .GE.
	
        !Aritméticas: + - * / **
	   print*, n+m
	   print*, n/m

	!Funciones intrinsecas
	   print*, abs(n)   !modulo de n
	   print*, mod(n,m) !resto de n/m

        END PROGRAM datatypes
        PROGRAM datatypes
                implicit none
        
                real 		:: x=1.2e-1, y=2.78
                real, parameter :: pi=3.14159265365897
        
        !Operaciones con REAL
        !Aritméticas: 	+ - * / **
                print*, 3+x*y
                print*, (3+x)*y
                print*, y**2*3
                print*, y**(2*3)
        !Funciones intrinsecas
                print*, sqrt(x),exp(x),log(x),log10(x);
                print*, sin(x),cos(x),tan(x);
                print*, asin(x),acos(x),atan(x);
                
                print*, real(7), int(7.000);
                print*, mod(x,y), abs(x);
                print*, min(x,y), max(x,y);
              
        END PROGRAM datatypes
        PROGRAM datatypes
                implicit none
                complex :: z1=(0,1),z2=(3,2)
        
       !Operaciones con COMPLEX
                print*, z1
                print*, z2
       !Aritmética: 	+ - * / **
                print*, z1+z2
                print*, z1-z2
                print*, z1*z2
                print*, z1/z2
                print*, z1**2
       
        !Funciones intrinsecas
                print*, real(z1)
                print*, aimag(z1)
                print*, conjg(z1)
                print*, abs(z2)
                print*, atan2(real(z2),aimag(z2))
        
        END PROGRAM datatypes
       program datatypes  
      
         implicit none

         character*30       :: str1="Esto es un string       "
         character (len=30) :: str2=", este es otro string.  "
  
         print*, str1
         
         !Operaciones con CHARACTER:
         print*, str1(9:25)
         print*, str1//str2
         print*, trim(str1)//trim(str2)
  
         print*, len(str1)
         print*, len(trim(str1))

         print*, repeat(str2(11:15),4)
         
         print*, scan(str1, 'aeiou')
         print*, index(str2, 'otro',back=.true.)
         print*, verify(str1,'Esto es un strang')
       end program datatypes
