	module mod_int
                implicit none
                real, private, parameter :: pi=3.14159265359

                interface RaizCuad
                        procedure raizCuadR, raizCuadC
                end interface

                contains

                function raizCuadR(x)    result(x_cuadrado)
                        real :: x, x_cuadrado
                        x_cuadrado=x*x
                end function
         
               function raizCuadC(x)    result(x_cuadrado)
                        complex :: x, x_cuadrado
                        x_cuadrado=x*x
                end function

	end module 

        program main
        
        use mod_int
        use mod_ext, only : area

        implicit none
        real :: r
        complex :: z

        r=10.
        print*, area(r)
        
        print*, raizCuad(r)

        z=(2.,1.)
        print*, raizCuad(z)

        end program

!COMPILACION
! gfortran -c 05ext_mod.f 05Modulos.f
! gfortran  05ext_mod.o 05Modulos.o

