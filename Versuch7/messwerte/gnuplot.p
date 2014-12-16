#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced
#set term qt
#set termoption enhanced

scal=0.03317
offs=458.59e3


set output "datenohneoffset.svg"

set grid
set key bottom right
set xlabel "(f-f_{0})/GHz"
set ylabel "(I_{Abs}-I_{Las}), beliebige Einheiten"

#off1(fpi)=fpi
#off2(lzr)=lzr

#fit off1(x) "offset.dat" u ($1):($3) via fpi
#fit off2(x) "offset.dat" u ($1):($2) via lzr

stats "lazor.dat" u ($2)
offlaz=STATS_min
maxlaz=STATS_max
stats "absorption10mA.dat.laz" u ($2)
off10m=STATS_min
stats "absorption12mA.dat.laz" u ($2)
off12m=STATS_min
stats "absorption14mA.dat.laz" u ($2)
off14m=STATS_min
stats "absorption16mA.dat.laz" u ($2)
off16m=STATS_min
stats "absorption18mA.dat.laz" u ($2)
off18m=STATS_min
stats "absorption20mA.dat.laz" u ($2)
off20m=STATS_min
stats "zeeman20mA.dat" u ($2)
offzee=STATS_min
maxzee=STATS_max
stats "zeeman20mAmitB.dat" u ($2)
offzB=STATS_min
maxzB=STATS_max
stats "zeeman20mAmitBzwei.dat" u ($2)
offzB2=STATS_min
maxzB2=STATS_max

#stats "offset.dat" u ($2)
#lzr=STATS_mean

p [2.5:5] "absorption10mA.dat.laz" u ($1*scal):($2-$5-off10m+offlaz) w lines title "Absorption, I_{p}=10mA", "absorption12mA.dat.laz" u ($1*scal):($2-$5-off12m+offlaz) w lines title "Absorption, I_{p}=12mA", "absorption14mA.dat.laz" u ($1*scal):($2-$5-off14m+offlaz) w lines title "Absorption, I_{p}=14mA", "absorption16mA.dat.laz" u ($1*scal):($2-off16m+offlaz-$5) w lines title "Absorption, I_{p}=16mA", "absorption18mA.dat.laz" u ($1*scal):($2-$5-off18m+offlaz) w lines title "Absorption, I_{p}=18mA", "absorption20mA.dat.laz" u ($1*scal):($2-off20m-$5+offlaz) w lines title "Absorption, I_{p}=20mA"
#pause -1

set output "zeeman.svg"

set ylabel "Intensität, beliebige Einheiten"

scalzB=((maxzB-offzB)*1.)/((maxlaz-offlaz)*1.)
scalzB2=((maxzB2-offzB2)*1.)/((maxlaz-offlaz)*1.)
scalzee=((maxzee-offzee)*1.)/((maxlaz-offlaz)*1.)

p [2.5:5] "zeeman20mAmitB.dat.laz" u ($1*scal):($2-offzB-($5-offlaz)*scalzB) w lines title "Absorption im Magnetfeld", "zeeman20mA.dat.laz" u ($1*scal):($2-offzee-($5-offlaz)*scalzee) w lines title "Absorption ohne Magnetfeld"

set term qt
#set output "absorption.svg"

p [2.5:5] "absorption10mA.dat.laz" u ($1*scal):($2-off10m) w lines title "Absorption, I_{p}=10mA", "absorption12mA.dat.laz" u ($1*scal):($2-off12m) w lines title "Absorption, I_{p}=12mA", "absorption14mA.dat.laz" u ($1*scal):($2-off14m) w lines title "Absorption, I_{p}=14mA", "absorption16mA.dat.laz" u ($1*scal):($2-off16m) w lines title "Absorption, I_{p}=16mA", "absorption18mA.dat.laz" u ($1*scal):($2-off18m) w lines title "Absorption, I_{p}=18mA", "absorption20mA.dat.laz" u ($1*scal):($2-off20m) w lines title "Absorption, I_{p}=20mA"
#pause -1

print "offset laser: ", offlaz
print "offset 10mA: ", off10m
print "offset 12mA: ", off12m
print "offset 14mA: ", off14m
print "offset 16mA: ", off16m
print "offset 18mA: ", off18m
print "offset 20mA: ", off20m
print "offset zeeman, 20mA: ", offzee
print "offset zeemanmit B, 20mA: ", offzB
print "offset zeeman mit B2, 20mA: ", offzB2
print "maximum zeeman 20mA: ", maxzee
print "maximum laser: ", maxlaz
print "skalierung mit B: ", scalzB
