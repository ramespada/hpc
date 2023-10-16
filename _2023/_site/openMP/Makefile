FC=gfortran
FFLAGS=-fopenmp 

helloworld: hello_omp.f90
	$(FC) $(FFLAGS) $^ -o $@
sections: sections_omp.f90
	$(FC) $(FFLAGS) $^ -o $@
saxpy: saxpy_omp.f90
	$(FC) $(FFLAGS) $^ -o $@
integral: integral_omp.f90
	$(FC) $(FFLAGS) $^ -o $@

