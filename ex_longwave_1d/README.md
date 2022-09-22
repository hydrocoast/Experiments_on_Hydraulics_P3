# Exercise: long wave run-up on a slope and wave shoaling
<p align="center">
<img src="/fig/ex_longwave.gif", width="700">
</p>  

The goal of this exercise is to simulate the long wave behavior that propagates on a slope.  

Several lines in [exercise_longwave_1d.f90](/ex_longwave_1d/exercise_longwave_1d.f90) are blank.
Please write the appropriate Fortran codes in these blank lines to complete the numerical simulation.  

Please refer to the instruction document for details.  

## Equations and discretization
The equations of the continuity and momentum with negligible Coriolis forces, frictional and viscous forces are expressed as:
$$\frac{\partial \eta}{\partial t} + \frac{\partial M}{\partial x}  = 0$$
$$\frac{\partial M}{\partial t} + \frac{M}{D}\frac{\partial M}{\partial x}  = -gD\frac{\partial \eta}{\partial x}$$
where $t$ represents time, $x$ represents space or position, $\eta$ is the water surface elevation, $D$ is the total depth ( $=\eta+h$ , $h$ is depth), $M$ is the flux in the $x$-dicretion ( $=uD$ , $u$ is the $x$-direction velocity), and $g$ is the gravity acceleration.  
The equations above can be discretized in the space employing the staggered grid as follows:  
$$\eta_i^{j+1} = \eta_i^j - \frac{\Delta t}{\Delta x} \left( M_{i+\frac{1}{2}}^{j} - M_{i-\frac{1}{2}}^{j}\right)$$

$$M_{i+\frac{1}{2}}^{j+1} = M_{i+\frac{1}{2}}^{j} -\Delta t \left( \frac{M_{i+\frac{1}{2}}^j}{\frac{D_{i+1}^j+D_i^j}{2}} \frac{M_{i+\frac{3}{2}}^j - M_{i-\frac{1}{2}}^j}{2\Delta x} +g \frac{D_{i+1}^j+D_i^j}{2} \frac{\eta_{i+1}^j-\eta_i^j}{\Delta x} \right) $$
where the subscript $i$ represents the $i$-th element of the discretized space with $\Delta x$, and 
the superscript $j$ represents the $j$-th element of the discretized time with $\Delta t$.

The figure below illustrates the defined location of the quantities in the staggered grid system:
<p align="center">
<img src="/fig/tikz_staggered_grid1d.png", width="700">
</p>



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
