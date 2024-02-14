# Exercise: 1D wave equation with a constant wave speed
<p align="center">
<img src="/fig/wave1d_bc_comparison.gif", width="700">
</p>  

The goal of this exercise is to run a numerical simulation based on the one-dimensional wave equation.  

Several lines in [exercise_waveeq_1d.f90](/ex_waveeq_1d/exercise_waveeq_1d.f90) are blank.
Please write the appropriate Fortran codes in these blank lines to complete the numerical simulation.  

Please refer to the instruction document for details.  

## Equations and discretization
The one-dimensional wave equation can be expressed as follows:
$$\frac{\partial ^2 \eta}{\partial t^2} - c^2 \frac{\partial ^2 \eta}{\partial x^2} = 0$$
where $\eta$ is the surface elevation, $t$ represents time, $x$ represents space or position, and $c$ is the wave speed (constant, non-negative, real). The central differencing in both time and space of this equation yields:
$$\eta_i^{j+1} = 2(1-\lambda^2)\eta_i^j + \lambda^2(\eta_{i+1}^j+\eta_{i-1}^j) - \eta_i^{j-1}$$
where the subscript $i$ represents the $i$-th element of the discretized space with $\Delta x$, the superscript $j$ represents the $j$-th element of the discretized time with $\Delta t$, and $\lambda$ is a constant value defined as:
$$\lambda = \left( c\frac{\Delta t}{\Delta x}\right)^2$$
The right hand side of the discretized equation contains only known values; the surface height at the next time step $\eta_i^{j+1}$ can be obtained with this equation. 

## Tips
- check the simulation environment  
  Please make sure that the necessary commands are installed in a terminal.  
  `make`, `gfortran`, and `gnuplot` should be in your `$PATH` to run the simulation.  
  If the following commands return blanks in your terminal, you need to install them or add the appropriate paths to the environment variable `$PATH`.
  ```shell
  which make
  ```
  ```shell
  which gfortran
  ```
  `gfortran` can be substituted by other Fortran compilers. In that case, please modify `FC` in [Makefile](/ex_waveeq_1d/Makefile).


- compile the Fortran source file  
  You can compile the main file (in Fortran) after filling the blank lines as follows:
  ```shell
  make
  ```

- run a simulation
  ```shell
  make run
  ```

- plot wave snapshots of the result
  ```shell
  make plot
  ```

- create an animation of the result
  ```shell
  make gif
  ```


## Notes
There are many ways to write code that yields a correct answer.
Any method is acceptable as long as the simulation is correct.

## License
Refer to [README](/README.md) in the top directory.


## Author
Refer to [README](/README.md) in the top directory.
