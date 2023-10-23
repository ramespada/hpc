CC=gcc
CC_CUDA=nvcc
FC=gfortran
FC_MPI=mpif90.mpich

FLAGS=
FLAGS_OMP=-fopenmp -fno-automatic 
FLAGS_MPI=
FLAGS_CUDA=

c.exe: saxpy.c
	$(CC)                    -o $@ $< 
f.exe: saxpy.f90
	$(FC)      $(FLAGS_F)    -o $@ $< 
omp.exe: saxpy_omp.f90
	$(FC)      $(FLAGS_OMP)  -o $@ $< 
mpi.exe: saxpy_mpi.f90
	$(FC_MPI)  $(FLAGS_MPI)  -o $@ $< 
cuda.exe: saxpy_cuda.cu
	$(CC_CUDA) $(FLAGS_CUDA) -o $@ $< 
clean:
	rm *.exe
