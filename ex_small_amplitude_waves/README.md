# Exercise: small wave amplitude theory

The goal of this exercise is to visualize the general properties of water surface waves based on the small wave amplitude theory and to confirm the dispersion relation.  

Please refer to the instruction document for details.

## Notes
No code in a specific language will be distributed in this exercise. You may write code in any language and plot figures to accomplish this exercise.  
The figure below shows an example plot that satisfies a part of this exercise.
<p align="center">
<img src="/fig/ex_SmallWaveAmplitudeTheory.gif", width="700">
</p>  


## Equations
Note that $a = H/2$ and the vertical upward direction is assumed to be positive for $z$.
- Velocity potential $\phi$  
$$\phi = \frac{ag}{\omega} \frac{\cosh k(z+h)}{\cosh kh} \sin (kx-\omega t)$$

- Horizontal and vertical velocities $u$, $v$
$$u = \frac{\partial \phi}{\partial x} = a\omega \frac{\cosh k(z+h)}{\sinh kh} \cos (kx-\omega t)$$

$$w = \frac{\partial \phi}{\partial z} = a\omega \frac{\sinh k(z+h)}{\sinh kh} \sin (kx-\omega t)$$


- Particle trajectory
$$\frac{(x-x_0)^2}{\left(a \frac{\cosh k(z_0+h)}{\sinh kh} \right)^2} + \frac{(z-z_0)^2}{\left(a \frac{\sinh k(z_0+h)}{\sinh kh} \right)^2}  = 0$$

