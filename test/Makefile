# Fortran compiler
FC := gfortran

# filename
F1 := test.f90
EXE1 := xtest
P1 := plot_wave_test.plt
P2 := plot_groupvelocity.plt

.PHONY: all clean run plot

all: exe run plot

exe:
	$(FC) $(F1) -fbacktrace -o $(EXE1)

run:
	./$(EXE1)

plot:
	gnuplot $(P1)

gif:
	gnuplot $(P2)

clean:
	-rm -f *.o *.so *.mod x* *.png
