        program procedimientos
        
                implicit none
                integer :: i
                real 	:: a,b,c
                
                a=1.
                b=2.
                c=0.
                
                print*,a,b,c
                
                !Función:
                c = suma(a,b)
                print*,a,b,c
                
                
             contains
                
                function suma(arg1,arg2) result(resultado)
                     implicit none
                     real, intent(in) :: arg1,arg2
                     real             :: resultado
                         
                     resultado=arg1+arg2
                end function suma
                
                
        end program procedimientos
        program procedimientos
        
                implicit none
                integer :: i
                real 	:: a,b,c
                
                a=1.;b=2.;c=0.
                print*,a,b,c
                
                
                call suma(a,b,c)
                print*,a,b,c
        
        contains
        
        subroutine suma(arg1,arg2,arg3) 
                implicit none
                real, intent(in)     :: arg1,arg2
                real, intent(inout)  :: arg3
       
                arg3=arg1+arg2
        end subroutine suma
        
        end program procedimientos

