file_in = "./wave1d_output.dat"
file_out = "wave1d.png"
dt = 0.2

set terminal png
set output file_out
set xrange [-10.5:10.5]
set yrange [-0.1:1.0]
set grid
set xlabel "x"
set ylabel "eta"
plot for [k=1:61:10] file_in using 1:k+1 with lines title sprintf("t =%7.2f",(k-1)*dt)
