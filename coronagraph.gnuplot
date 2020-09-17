set datafile separator ','
set xdata time # tells gnuplot the x axis is time data
set timefmt "%Y-%m-%d"
set format x "%Y-%m-%d"
set key autotitle columnhead # use the first line as title
set ylabel "" tc rgb 'white'
set xlabel "Date" tc rgb 'white'
set title "UK COVID-19 STATS UPDATED ".strftime("%Y-%m-%d", time(0)) tc rgb 'white'
set border lc rgb 'white' lw 4
set key tc rgb 'white'
set linetype 1 lc rgb 'white'
set style line 100 lt 1 lc rgb "white" lw 1 # grid
set style line 101 lt 1 lc rgb "white" lw 3 # style for cases
set style line 102 lt 1 lc rgb "red" lw 3 # style for deaths
set grid ls 100 # enable grid
set ytics 1000 # smaller ytics
set terminal pngcairo size 2400,1200 enhanced font 'IBM Plex Mono,24' background rgb 'black' # formats png with black background
set output 'coronagraph.png'
plot 'coronastats.csv' using 1:2 with lines ls 101, '' using 1:3 with lines ls 102
