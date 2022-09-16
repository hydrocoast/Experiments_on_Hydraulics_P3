file_timeseries = "./longwave1d_output.dat"
file_h = "./depth_h.dat"
file_max = "./eta_max.dat"
file_out = "longwave1d.png"
dt = 0.5

set terminal png
set xrange [-20:570]
set yrange [-0.05:0.22]
set grid
set key left top maxrows 5
set xlabel "x (m)"
set ylabel "eta (m)"
set output file_out

plot for [k=1:121:10] file_timeseries using 1:k+1 with lines title sprintf("t =%7.2f",(k-1)*dt), \
         file_max using 1:2 with lines lc 'orchid' lw 2 title "max", \
         file_h using 1:(-$2/1000) with lines lc black lw 2 title "h/1000"
