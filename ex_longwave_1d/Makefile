# Fortran compiler
FC := gfortran

# filename
F1 := exercise_longwave_1d.f90
EXE1 := xlongwave1d
P0 := plot_incidentwave.plt
P1 := plot_longwave1d.plt
P2 := plot_longwave1d_gif.plt

.PHONY: all clean run plot inwave

all: exe

exe:
	$(FC) $(F1) -fbacktrace -o $(EXE1)

run:
	./$(EXE1)

inwave:
	gnuplot $(P0)

plot:
	gnuplot $(P1)

gif:
	gnuplot $(P2)

clean:
	-rm -f *.o *.so *.mod x*
