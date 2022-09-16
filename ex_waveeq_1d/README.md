# Exercise: 1D wave equation with a constant wave speed
<p align="center">
<img src="/fig/wave1d_bc_comparison.gif", width="700">
</p>  

The goal of this exercise is to run a numerical simulation based on the one-dimensional wave equation.  

Several lines in [exercise_waveeq_1d.f90](/ex_waveeq_1d/exercise_waveeq_1d.f90) are blank.
Please write the appropriate Fortran codes in these blank lines to complete the numerical simulation.  

Please refer to the instruction document for details.


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
