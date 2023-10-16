  program memory
    implicit none
    
    real, ALLOCATABLE  :: A(:,:)
    integer :: i
   
    allocate(A(3,3))
    
    A=0.
    do i=1,3
            A(i,i)=1.0
    end do
    
    write(*,'(("size:"i3)"; shape:"2(i3))') size(A),shape(A) 
    write(*,'(3(f9.3))')A

    deallocate(A)
    
    allocate(A(2,2))
    A=3.2321

    write(*,'(("size:"i3)"; shape:"2(i3))') size(A),shape(A) 
    write(*,'(2(f9.3))')A

  end program memory
