set terminal pdfcairo color enhanced
set xrange [-10.5:10.5]
set yrange [-1.0:1.0]
set grid
set xlabel "x"
set ylabel "eta"
set terminal gif animate delay 8
set output "wave1d_bc_comparison.gif"

dt = 0.2
do for [k=1:101]{
    plot "./wave1d_output_closed.dat" using 1:k+1 with lines title sprintf("closed, t = %05.2f",(k-1)*dt), \
         "./wave1d_output_periodic.dat" using 1:k+1 with lines title sprintf("periodic, t = %05.2f",(k-1)*dt), \
         "./wave1d_output_open.dat" using 1:k+1 with lines title sprintf("open, t = %05.2f",(k-1)*dt),
}
set output
