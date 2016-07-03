#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced

set grid
set xlabel "β_{1}"
set ylabel "Ω"
set key bot left
p [0:0.2] [1.38:1.58] "beefurkation.data" u 2:1:(0.00827):(0.00302) lt 9 ps 1 lc 1 with xyerrorbars title "Bifurkationspunkt Rotations-Einer zu -Zweier" , "beefurkation2.data" u 2:1:(0.00827):(0.00302) lt 11 ps 1 lc 2 w xyerrorbars title "Bifurkationspunkt Rotations-Zweier zu -Vierer"
