#include <sdtio.h>

/*Concepto a profundizar:
 Los arrays estàn intimamente ligados a pointers. Son conjuntos de elementos guardados en la memoria de forma consecutiva con determinada longitud.
 Generalente cuando pasamos un array estamos pasando el adress del primer elemento. 

 */
int main(){

	int n[3]={0,  3 , -2};
	float v[3]={0.001, -3.12, 15.0 }

	float A[3][3]={ 1.0, 0.0, 0.0,
	       		0.0, 2.0, 0.0,
		       	0.0, 0.0 ,3.0}

	return 0;
}
/*
   
   character(len=20), dimension(5) :: frutas
   integer :: n(3)
   real    :: v(3)
   real    :: A(3,3)
   integer :: i
   
   !Acceso y asignacion de valores:
   frutas(1)='manzana'
   frutas(2)='banana'
   frutas(4)='kiwi'
           
   print*, frutas
   print*, frutas(4)
   print*, frutas(2:4)
   
   !loops:
   do i=1,3,1
           v(i)=i*0.45
   end do
   print*, v
   !loops implicitos
   n=(/ (i,i=1,9,3) /)
   print*,n
   v=(/ (i,i=1, 3,1)  /)*0.45
   print*, v
   v=(/ (i*0.45,i=1, 3,1)  /)  !otra forma
   print*, v
   
   A= 0.                       !todos ceros
   print*,"Nula:"
   write(*,'(3(f8.2))') A
   
   print*, "Identidad:"
   A(1,:)=(/ 1.0, 0.0, 0.0 /)
   A(2,:)=(/ 0.0, 1.0, 0.0 /)
   A(3,:)=(/ 0.0, 0.0, 1.0 /)
   write(*,'(3(f8.2))') A
   
   print*, "Matriz A:"
   A = reshape((/(i*0.25,i=1,size(A))/), shape(A))
   write(*,'(3(f8.2))') A
   
   !Aritmética + - * /   (entre aquellos de misma forma!!)
   print*,'A+A' 
   write(*,'(3(f8.2))') A+A
   print*,'A*A'
   write(*,'(3(f8.2))') A*A
   
   !Intrinsecos a arrays:
   print*,'sum(A)', sum(A)
   print*,'product(A)',product(A)
   
   print*,'size(A)', size(A)
   print*,'shape(A)',shape(A)
   
   print*,'lbound(A)',lbound(A)
   print*,'ubound(A)',ubound(A)
   
   print*,'minval(A)',minval(A)
   print*,'maxval(A)',maxval(A)
   print*,'minloc(A)',minloc(A)
   print*,'maxloc(A)',maxloc(A)
   
   !Operaciones relacionales
   print*,'all(A<0.3)',all(A<0.3)
   print*,'any(A<0.6)',any(A<0.6)
   print*,'count(A>0.4)',count(A>0.4)
*/
