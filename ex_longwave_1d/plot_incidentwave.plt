file_in = "./incident_wave.dat"
file_out = "./incident_wave.png"

set terminal png
set output file_out
set grid
set xlabel "t (s)"
set ylabel "eta (m)"
plot file_in using 1:2 with lines title "incident wave from the west boundary"
