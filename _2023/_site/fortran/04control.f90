        PROGRAM control
                implicit none
                real    :: x
                
                x=1.0
                
               !CONDICIONALES (IF,ELSE,ELSE IF)
              if (x>0) then
                        print*, "x es positivo"
               else if (x<0) then
                        print*, "x es negativo"
               else
                        print*, "x es cero"
              end if

               !SWITCHES (SELECT/CASE)
                
               select case(x)
                 case(>0)
                        print*, "x es positivo"
                 case(<0)
                        print*, 'x es negativo'
                 case default
                        print*, "x es cero"
               end select

        END PROGRAM control
        PROGRAM control
                implicit none

                integer :: i
        !DO
        do i=-6,10,2
                print*,i
        end do
    
        !DO WHILE
        i=1
        do while (i<10)
                print*, i
                i=i+1
        end do

        END PROGRAM control
