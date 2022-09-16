# Exercise: long wave run-up on a slope and wave shoaling
<p align="center">
<img src="/fig/ex_longwave.gif", width="700">
</p>  

The goal of this exercise is to simulate the long wave behavior that propagates on a slope.  

Several lines in [exercise_longwave_1d.f90](/ex_longwave_1d/exercise_longwave_1d.f90) are blank.
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
  `gfortran` can be substituted by other Fortran compilers. In that case, please modify `FC` in [Makefile](/ex_longwave_1d/Makefile).

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

- plot time-series of the incident wave
  ```shell
  make inwave
  ```


## Notes
There are many ways to write code that yields a correct answer. Any method is acceptable as long as the simulation is correct. In this exercise, the coding lines are separated by term for clarity.

## License
Refer to [README](/README.md) in the top directory. 

## Author
Refer to [README](/README.md) in the top directory. 