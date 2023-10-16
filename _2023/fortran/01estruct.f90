        PROGRAM nombre_del_programa
            
           !Esto es un comentario

           !Declaracion de variables:
            implicit none
            character(len=10) :: nombre 
        
            nombre='estimado' 
            
           !Instrucciones del programa:
            print*,"Cual es tu nombre?"
            read*,nombre
            
            print*,"Hola ",nombre,"! Todo tranqui?" 
             
        END PROGRAM
