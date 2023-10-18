        module mod_ext
                implicit none
                	real,private, parameter :: pi=3.14159265359
                
               contains
                
                function area(r)        result(A)
                        implicit none
                	real, intent(in) :: r
                	real :: A
                
                        A=2*pi*r*r
                 
               end function area
                
        end module 
