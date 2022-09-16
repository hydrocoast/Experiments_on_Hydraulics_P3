# ------
file_in = "./incident_wave.dat"
file_out = "./incident_wave.png"

set terminal png
set output file_out
set grid
set xlabel "t (s)"
set ylabel "eta (m)"
plot file_in using 1:2 with lines title "incident wave from the west boundary"

# ------

file_in = "./depth_h.dat"
file_out = "./depth_h.png"

set terminal png
set output file_out
set grid
set xlabel "x (m)"
set ylabel "water depth (m)"
set xrange [-50:600]
set yrange [-35:0]
plot file_in using 1:(-$2) with lines lc black lw 2 title "h"

# ------
