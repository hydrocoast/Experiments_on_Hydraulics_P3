file_in = "./wave1d_output.dat"
file_out = "wave1d.gif"

set terminal pdfcairo color enhanced
set xrange [-10.5:10.5]
set yrange [-0.1:1.0]
set grid
set xlabel "x"
set ylabel "eta"
set terminal gif animate delay 5
set output file_out

dt = 0.2
do for [k=1:101]{
    plot file_in using 1:k+1 with lines title sprintf("t =%7.2f",(k-1)*dt)
}
set output
