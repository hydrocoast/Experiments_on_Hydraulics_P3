# parameters
a = 0.5
g = 9.8
k1 = 5.0
k2 = 5.1
h = 10.0
phi1 = 0.25*pi
phi2 = 1/3*pi
omega1 = sqrt(g*k1*tanh(k1*h))
omega2 = sqrt(g*k2*tanh(k2*h))

# appearance
set xrange [-10*pi:10*pi]
set yrange [-1.0:1.0]
set xlabel "x"
set ylabel "eta"
set grid

# draw and output
set terminal gif animate delay 5 optimize size 1000,250
set output "groupvelocity.gif"
set samples 2000
dt = 1.0
do for [k=1:101]{
    t = 0.0 + (k-1)*dt
    plot a*sin(k1*x - omega1*t + phi1) title "eta1", \
         a*sin(k2*x - omega2*t + phi2) title "eta2" , \
         a*(sin(k1*x - omega1*t + phi1) + sin(k2*x - omega2*t + phi2)) title "eta1+eta2" ,\
         2*a*cos(0.5*((k1-k2)*x - (omega1-omega2)*t + (phi1 - phi2))) lc "gray70" title "envelope", \
         -2*a*cos(0.5*((k1-k2)*x - (omega1-omega2)*t + (phi1 - phi2))) lc "gray70" notitle
}
set output

