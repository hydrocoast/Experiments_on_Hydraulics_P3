# Fortran compiler
FC := gfortran

# filename
F1 := exercise_waveeq_1d.f90
EXE1 := xwaveeq1d
P1 := plot_wave1d.plt
P2 := plot_wave1d_gif.plt

.PHONY: all clean run plot gif

all: exe

exe:
	$(FC) $(F1) -fbacktrace -o $(EXE1)

run:
	./$(EXE1)

plot:
	gnuplot $(P1)

gif:
	gnuplot $(P2)

clean:
	-rm -f *.o *.so *.mod x*
