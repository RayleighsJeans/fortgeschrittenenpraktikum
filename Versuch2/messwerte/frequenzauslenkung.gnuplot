#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced

set grid
set xtics 0.1
set xlabel "Auslenkung x_{max}/π"
set ylabel "normierte Frequenz f/f_{0}"
set key bottom left
ff0(x)=1/(1+0.07125*(x)**2)
tit="Messwerte mit Fehlerboxen"
p [0:1] [0.4:1.01] "frequenzauslenkung2.data" u (1+((($1+$2)/2.)/3.06-0.5)*2):(0.5*$3/799.):(abs(((($1-$2)+0.003)/3.06))):(30./799.) with xyerrorbars title "Toms ".tit,"frequenzauslenkung.data" u (1+((($1+$2)/2.)/3.06-0.5)*2):(0.5*$3/799.):(abs(((($1-$2)+.034)/3.06))):(40./799.) with xyerrorbars title "Philipps ".tit, ff0(x*pi) title "Näherung (1+0,07125*(x_{max})^{2})^{-1}"
