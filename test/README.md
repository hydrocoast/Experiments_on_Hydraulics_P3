# Test your environment
<p align="center">
<img src="/fig/groupvelocity.gif", width="700">
</p>  

This directory has nothing to do with the content of the assignment.  
It is just to check your environment before you start working on the assignment.

- preparation  
  Please make sure that the necessary commands are installed in a terminal.  
  `make`, `gfortran`, and `gnuplot` should be in your `$PATH` to run the simulation.  
  If the following commands return blanks in your terminal, you need to install them or add the appropriate paths to the environment variable `$PATH`.
  ```shell
  which make
  ```
  ```shell
  which gfortran
  ```
  ```shell
  which gnuplot
  ```
  `gfortran` can be substituted by other Fortran compilers. In that case, please modify `FC` in [Makefile](/test/Makefile).

- compile a Fortran source  
  ```shell
  make exe
  ```

- run a test code  
  ```shell
  make run
  ```

- plot a test  
  ```shell
  make plot
  ```

- another test: creating a gif using gnuplot  
  ```shell
  make gif
  ```

