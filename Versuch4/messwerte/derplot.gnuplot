#!/usr/bin/gnuplot

set terminal svg size 768,384 enhanced

set output "resonanzfrequenzen.svg"

set key right bottom
set grid
set ylabel "Resonanzfrequenz f in Hz"
set xlabel "Index der Resonanz n"

f1(n)=a1*n
f2(n)=a2*n
f3(n)=a3*n

fit f1(x) "resonanzen.data" via a1
fit f2(x) "resonanzen2.data" every ::1 u ($1-1):2 via a2
fit f3(x) "resonanzen3.data" every ::1 u ($1-1):2 via a3

p [0:20] [0:7000] "resonanzen.data" lc 1 title "Resonanzen bei Rohrlänge 600mm", "resonanzen2.data" u ($1-1):2 lc 2 title "Resonanzen bei Rohrlänge 300mm", "resonanzen3.data" u ($1-1):2 lc 3 title "Resonanzen bei Rohrlänge 75mm", f1(x) lc 1 title "Fit f_n für 600mm",f2(x) lc 2 title "Fit f_n für 300mm",f3(x) lc 3 title "Fit f_n für 75mm"

set output "resonanzfrequenzencomputer.svg"

d(x)=x==329 || x==592 || x==873 || x==1154 || x==1436 || x==1718 || x==1999 || x==2293 || x==2583 || x==2869 || x==3152 || x==3437 || x==3721 || x==4004 || x==4290 || x==4573 || x==4864 || x==5147 || x==5433 || x==5718 ? 1 : 0

set samples 10001
set key right top

set ylabel "Intensität; beliebige Einheiten"
set xlabel "Frequenz in Hz"

p [0:10000] [0:80] "Messung8roehren100-110kHz.dat" with lines title "Computermessung", d(x)*80 title "Handmessung"

unset samples

set output "sphaeren0-10kHz.svg"

set xlabel "Frequenz in Hz"
set ylabel "Intensität; beliebige Einheiten"
set key top left

p "Messungsphaere0-10kHzalpha180.dat" w lines title "Sphäre bei α=180°" , "Messungsphaere0-10kHzalpha0.dat" w lines title "Sphäre bei α=0°"

unset key

set output "sphaerendetailiertesspektrum.svg"
set key top left
p "Messungsphaere4850-5kHzalpha0.dat" w lines title "Sphäre bei α=0°", "Messungsphaere4850-5kHzalpha20.dat" w lines title "Sphäre bei α=20°", "Messungsphaere4850-5kHzalpha40.dat" w lines title "Sphäre bei α=40°"

set output "polarl3.svg"
set polar
set key top left
unset grid
unset xlabel
unset ylabel
unset xtics
unset ytics

p "4990Hzl3.dat" u (($1)/360.*2*pi):2 lc -1 title "Y_{l}^{m}(θ)" w lines,"4990Hzl3.dat" u (-($1)/360.*2*pi):2 lc -1 notitle w lines,"4990Hzl3.dat" u (pi-($1)/360.*2*pi):2 lc -1 notitle w lines,"4990Hzl3.dat" u (pi+($1)/360.*2*pi):2 lc -1 notitle w lines

unset polar

set output "abstandsringe.svg"

set xlabel "Intensität; beliebige Einheiten"
set ylabel "Frequenz in Hz"
set key top left
set grid

p "Messungsphaere1.5k-5.5kHzalpha180.dat" w lines, "Messungsphaere3mm1.5k-5.5kHzalpha180.dat" w lines, "Messungsphaere6mm1.5k-5.5kHzalpha180.dat" w lines, "Messungsphaere9mm1.5k-5.5kHzalpha180.dat" w lines title "Sphäre, 9mm Abstand"
