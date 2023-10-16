program kind
   implicit none
   
   integer, PARAMETER :: i8 = SELECTED_INT_KIND(2)
   integer, PARAMETER :: i16= SELECTED_INT_KIND(4)
   integer, PARAMETER :: i32= SELECTED_INT_KIND(9)
   integer, PARAMETER :: i64= SELECTED_INT_KIND(18)
 
   INTEGER, PARAMETER :: sp = SELECTED_REAL_KIND(6,37)
   INTEGER, PARAMETER :: dp = SELECTED_REAL_KIND(15,307)
   INTEGER, PARAMETER :: qp = SELECTED_REAL_KIND(30,291)
 
   integer(kind=i8)  :: int_i8 =2
   integer(kind=i16) :: int_i16=2
   integer(kind=i32) :: int_i32=2
   integer(kind=i64) :: int_i64=2

   real(kind=sp) :: float_sp=3.14159265359
   real(kind=dp) :: float_dp=2.71828182846
   real(kind=qp) :: float_qp=1.41421356237

   integer(kind=1) :: i
               
   
   write(*,'("KIND: "4(i24))')i8,i16,i32,i64
        do i=1,64,1
                write(*,'("2**"(i2)"="4(i24))') i,int_i8**i,int_i16**i, int_i32**i,int_i64**i
        end do 
   
   print*, huge(int_i16)
   print*, digits(int_i16), radix(int_i16), range(int_i16)

   print*, float_sp,float_dp,float_qp
   !print*, kind(float_dp)
   print*, tiny(float_dp), epsilon(float_dp), huge(float_dp)
   print*, nearest(float_dp,1.)
   print*, digits(float_dp), radix(float_dp), range(float_dp)
   print*, minexponent(float_dp), maxexponent(float_dp)

   
end program 
