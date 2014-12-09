#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced
set grid

set output "diodenleistung.svg"

set xlabel "Diodenstrom I_{D}/mA"
set ylabel "Diodenleistung P_{D}/mW"

paper(x)=-0.26+0.1176*x
selbst(x)=a*x+b

fit selbst(x) "auseichkurve.data" via a,b

#cut(x,y)=( x<609. && x>160. ) ? y : NaN	y u no work?

thresh(x)=m*x+c

#fit thresh(x) "laserdiodenleistung.data" u ($1):(cut($1,selbst($2))) via m,c		y u no work?

fit thresh(x) "laserdiodenleistungcutfuerfit.data" u ($1):(selbst($2)) via m,c

set key top left

p [0:650] [-500:5500] "laserdiodenleistung.data" u ($1):(selbst($2)) title "Messdaten für Laser-Diode" lt 8 lc -1, thresh(x) title "Fit für I_{th}"

unset xlabel
unset ylabel
set key top right

set xlabel "Temperatur der Diode T/°C"
set ylabel "Strahlungsleistung P/mW"

set output "fluoreszenz.svg"

p "lasertemperaturleistung.data" u ($1):(selbst($2)) title "Strahlungsleistung mit Nd:YAG-Stab" lt 8 lc -1

set output "laserleistung.svg"

set xlabel "Pumpleistung P/mW"
set ylabel "Laser-Leistung P/mW"
set key top left

lzrp(x)=d*x+e

fit lzrp(x) "laserndyagleistung.data" u ($1):(selbst($2)) via d,e

p "laserndyagleistung.data" u (thresh($1)):(selbst($2)-b) title "Leistung des Lasers(Pumpleistung)" lt 8 lc -1

set output "lasergreun.svg"

set xlabel "Leistung der Grundwelle P/mW"
set ylabel "Leistung 1. Oberwelle P/mW"

p "laserndyaggruenleistung.data" u (lzrp($1)):(selbst($2)-b) lt 8 lc -1 title "1. Oberwelle in Abhängigkeit der Grundwelle"

print "anstieg, kennlinie diode: ", a
print "offset, kennlinie diode: ", b
print "anstieg, pumpleistung: ", m
print "offset, pumpleistung: ", c
print "threshold-strom der diode: ", (-c)/(m)
print "anstieg lazor: ", d
print "offset lazor: ", e
