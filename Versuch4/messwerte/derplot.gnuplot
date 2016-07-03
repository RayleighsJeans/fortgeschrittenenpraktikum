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

set terminal svg size 384,384 enhanced
unset border

set polar
set key top left
unset grid
unset xlabel
unset ylabel
unset tics



set output "polarl1.svg"
datei="2300Hzl1.dat"

p datei u (($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi+($1)/360.*2*pi):2 lc -1 notitle w lines

set output "polarl2.svg"
datei="3700Hzl2.dat"

p datei u (($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi+($1)/360.*2*pi):2 lc -1 notitle w lines

set output "polarl3.svg"
datei="4990Hzl3.dat"

p datei u (($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi+($1)/360.*2*pi):2 lc -1 notitle w lines

set output "polarl4.svg"
datei="6180Hzl4.dat"

p datei u (($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi-($1)/360.*2*pi):2 lc -1 notitle w lines, datei u (pi+($1)/360.*2*pi):2 lc -1 notitle w lines

set output "polarl1m0.svg"
datei="2073Hzl1m0.dat"

p datei u ($1/360.*2*pi):2 w lines lc -1 notitle, datei u (-$1/360.*2*pi):2 lc -1w lines notitle , datei u (pi+$1/360.*2*pi):2 lc -1 w lines notitle , datei u (pi-$1/360.*2*pi):2 lc -1 w lines notitle

set output "polarl1m1.svg"
datei="2249Hzl1m+-1.dat"

p datei u ($1/360.*2*pi):2 w lines lc -1 notitle, datei u (-$1/360.*2*pi):2 lc -1w lines notitle , datei u (pi+$1/360.*2*pi):2 lc -1 w lines notitle , datei u (pi-$1/360.*2*pi):2 lc -1 w lines notitle

set output "polar1s.svg"
datei="430Hz1s.dat"

p datei u ($1/360.*2*pi):2 w lines lc -1 notitle, datei u (-$1/360.*2*pi):2 lc -1w lines notitle , datei u (pi+$1/360.*2*pi):2 lc -1 w lines notitle , datei u (pi-$1/360.*2*pi):2 lc -1 w lines notitle

set terminal svg size 768,384 enhanced
set output "abstandsringe1.5-3kHz.svg"

unset polar
set border
set key top left
set grid
set xtics autofreq
set ytics autofreq

set ylabel "Intensität; beliebige Einheiten"
set xlabel "Frequenz in Hz"

s0mm="kein Abstandsring"
s3mm="3mm Abstand"
s6mm="6mm Abstand"
s9mm="9mm Abstand"

p [1500:3000] "Messungsphaere1.5k-5.5kHzalpha180.dat" w lines title s0mm, "Messungsphaere3mm1.5k-5.5kHzalpha180.dat" w lines title s3mm, "Messungsphaere6mm1.5k-5.5kHzalpha180.dat" w lines title s6mm, "Messungsphaere9mm1.5k-5.5kHzalpha180.dat" w lines title s9mm lc 7

set output "abstandsringe3-4kHz.svg"

p [3000:4000] "Messungsphaere1.5k-5.5kHzalpha180.dat" w lines title s0mm, "Messungsphaere3mm1.5k-5.5kHzalpha180.dat" w lines title s3mm, "Messungsphaere6mm1.5k-5.5kHzalpha180.dat" w lines title s6mm, "Messungsphaere9mm1.5k-5.5kHzalpha180.dat" w lines title s9mm lc 7

set output "abstandsringe4-5.5kHz.svg"

p [4000:5500] "Messungsphaere1.5k-5.5kHzalpha180.dat" w lines title s0mm, "Messungsphaere3mm1.5k-5.5kHzalpha180.dat" w lines title s3mm, "Messungsphaere6mm1.5k-5.5kHzalpha180.dat" w lines title s6mm, "Messungsphaere9mm1.5k-5.5kHzalpha180.dat" w lines title s9mm lc 7

set output "doppelsphrenspektrum.svg"

set key top left
set ylabel "Intensität; beliebige Einheiten"
set xlabel "Frequenz in Hz"

p [150:600] "Messungsphaere0-1kHzalpha0.dat" w lines title "einzelne Sphäre", "Messungdoppelsphaere0-1kHzalpha0blende5mm.dat" w lines title "gekoppelte Sphären, 5mm", "Messungdoppelsphaere0-1kHzalpha0blende10mm.dat" w lines title "gekoppelte Sphären, 10mm" , "Messungdoppelsphaere0-1kHzalpha0blende15mm.dat" lc 7 w lines title "gekoppelte Sphären, 15mm", "Messungdoppelsphaere0-1kHzalpha0blende20mm.dat" w lines title "gekoppelte Sphären, 20mm"

set output "resonanzendoppelsphre.svg"

set key bot right
set xlabel "Blendendurchmesser d in mm"
set ylabel "Resonanzfrequenz f in Hz"

r(d)=a*d+b
fit r(x) "resonanzdoppelsphre.data" u (log($1)):(log($2)) via a,b
#w(d)=c*sqrt(d)
#fit w(x) "resonanzdoppelsphre.data" via c
p [0:30] "resonanzdoppelsphre.data" title "aus Messdaten", exp(r(log(x))) title "Fit an die Messdaten proportional d^{0.584}"
