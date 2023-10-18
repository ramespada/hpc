program secions
 use omp_lib

 implicit none
 real :: v(2**20)
 real :: start, finish
 real :: start0, finish0

print*,"Size of array:",size(v)
CALL CPU_TIME(start0)
CALL RANDOM_NUMBER(v)
!$OMP PARALLEL
  print*,"N THREADS=",omp_get_num_threads()
  !$OMP SECTIONS
      !$omp section
        !call cpu_time(start)
        call calc_min(v)
        !call cpu_time(finish)
        !print '("Time Min = ",f6.3," seconds.")',finish-start
      !$omp section
        !call cpu_time(start)
        call calc_max(v)
        !call cpu_time(finish)
        !print '("Time Max = ",f6.3," seconds.")',finish-start
      !$omp section
        !call cpu_time(start)
        call calc_avg(v)
        !call cpu_time(finish)
        !print '("Time Avg = ",f6.3," seconds.")',finish-start
  !$OMP END SECTIONS
!$OMP END PARALLEL
CALL CPU_TIME(finish0)
print '("Overall Time=",f8.5," seconds.")',finish0-start0

contains
subroutine calc_min(a)
   implicit none
   real :: a(:)
   real :: o
   integer :: i
   o=a(1)
   do i=2,size(a)
        if (a(i) < o) then
           o=a(i)
        endif     
   enddo
   print '("Min = ",f12.3)',o
end subroutine
subroutine calc_max(a)
   implicit none
   real :: a(:)
   real :: o
   integer :: i
   o=a(1)
   do i=2,size(a)
        if ( a(i) > o) then
           o=a(i)
        endif     
   enddo
   print '("Max = ",f12.3)',o
end subroutine
subroutine calc_avg(a)
   implicit none
   real :: a(:)
   real :: o
   integer :: i
   o=0
   do i=1,size(a)
        o=o+a(i)
   enddo
   print '("Avg = ",f12.3)',o
end subroutine

end program
