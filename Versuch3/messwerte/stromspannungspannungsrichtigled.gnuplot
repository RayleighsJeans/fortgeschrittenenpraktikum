#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced dash
set grid
set key left
set ylabel "I/μA"
set xlabel "U/V"
Irot(u)=arot*(exp(u*brot)-1.)-crot
Iblau(u)=ablau*(exp(u*bblau)-1.)-cblau
Igrun(u)=agrun*(exp(u*bgrun)-1.)-cgrun
crot=473.
cblau=2322.
cgrun=1009.
fit Irot(x) "stromspannungspannungsrichtigrot.data" u 1:2 via brot,arot
fit Iblau(x) "stromspannungspannungsrichtigblau.data" u 1:2 via bblau,ablau
fit Igrun(x) "stromspannungspannungsrichtiggruen.data" u 1:2 via bgrun,agrun
z=1e3
set output "stromspannungspannungsrichtigled.svg"
p Irot(x) ls 2 lc 1 title "Fit der roten LED" , Iblau(x) ls 5 lc 3 title "Fit der blauen LED", \
Igrun(x) ls 4 lc 2 title "Fit der grünen LED", "stromspannungspannungsrichtigrot.data" u 1:2 lt 1 lc 1 title "Messwerte: rote LED", \
"stromspannungspannungsrichtigblau.data" u 1:2 lt 2 lc 3 title "Messwerte: blaue LED", \
"stromspannungspannungsrichtiggruen.data" u 1:2 lt 3 lc 2 title "Messwerte: grüne LED"
set output "stromspannungspannungsrichtigbelastungled.svg"
Irotb(u)=arotb*(exp(u*brotb)-1.)-crotb
Iblaub(u)=ablaub*(exp(u*bblaub)-1.)-cblaub
crotb=440.
cblaub=2500.
fit Irotb(x) "stromspannungsunterbelastungrot.data" u 1:2 via arotb,brotb
fit Iblaub(x) "stromspannungsunterbelastungblau.data" u 1:2 via ablaub,bblaub
p [-4:5] [-3000:6000] "stromspannungsunterbelastungrot.data" u 1:2 lt 1 lc 1 title "Messwerte: rote LED (Belastung)", \
"stromspannungsunterbelastungblau.data" u 1:2 lt 2 lc 3 title "Messwerte: blaue LED (Belastung)", \
Irot(x) ls 2 lc 1 title "Fit der roten LED (belastet)" , Iblaub(x) ls 5 lc 3 title "Fit der blauen LED (belastet)"
set output "stromspannungslampeundsonne.svg"
set ylabel "I/mA"
Ilampe(u)=alampe*(exp(u*blampe)-1.)-clampe
Isonne(u)=asonne*(exp(u*bsonne)-1.)-csonne
Ilampeb(u)=alampeb*(exp(u*blampeb)-1.)-clampeb
clampe=54.10
csonne=15.
clampeb=66.
fit Isonne(x) "stromspannungssonneunterbelastung.data" u 1:2 via asonne,bsonne
fit Ilampe(x) "stromspannungslampe.data" u 1:2 via alampe,blampe
fit Ilampeb(x) "stromspannungslampeunterbelastung.data" u 1:($2*(-1.))  via alampeb,blampeb
p "stromspannungssonneunterbelastung.data" u 1:2 lt 1 lc 1 title "Messwerte: Sonne (Belastung)", \
"stromspannungslampe.data" u 1:2 lt 2 lc 3 title "Messwerte: Lampe", \
"stromspannungslampeunterbelastung.data" u 1:($2*(-1.)) lt 3 lc 2 title "Messwerte: Lampe (Belastung)", \
Isonne(x) ls 2 lc 1 title "Fit für \"in der Sonne\"" , Ilampe(x) ls 5 lc 3 title "Fit der Lampe", Ilampeb(x) ls 4 lc 2 title "Fit der Lampe (belastet)"

pdiffrot(x)=arot*(brot*x*exp(brot*x)+exp(brot*x)-1.)-crot
pdiffrotb(x)=arotb*(brotb*x*exp(brotb*x)+exp(brotb*x)-1.)-crotb
pdiffblau(x)=ablau*(bblau*x*exp(bblau*x)+exp(bblau*x)-1.)-cblau
pdiffblaub(x)=ablaub*(bblaub*x*exp(bblaub*x)+exp(bblaub*x)-1.)-cblaub
pdiffgrun(x)=agrun*(bgrun*x*exp(bgrun*x)+exp(bgrun*x)-1.)-cgrun
pdifflampe(x)=alampe*(blampe*x*exp(blampe*x)+exp(blampe*x)-1.)-clampe
pdifflampeb(x)=alampeb*(blampeb*x*exp(blampeb*x)+exp(blampeb*x)-1.)-clampeb
pdiffsonne(x)=asonne*(bsonne*x*exp(bsonne*x)+exp(bsonne*x)-1.)-csonne



xrot=log(crot/arot+1.)/brot
xblau=log(cblau/ablau+1.)/bblau
xblaub=log(cblaub/ablaub+1.)/bblaub
xrotb=log(crotb/arotb+1.)/brotb
xgrun=log(cgrun/agrun+1.)/bgrun
xlampe=log(clampe/alampe+1.)/blampe
xlampeb=log(clampeb/alampeb+1.)/blampeb
xsonne=log(csonne/asonne+1.)/bsonne

print "rot ", arot , " & " , brot, " & " ,  crot, " & " , xrot
print "blau ", ablau," & " , bblau," & " , cblau," & " , xblau
print "gruen ", agrun," & " , bgrun," & " , cgrun," & " , xgrun
print "rotb ", arotb," & " , brotb," & " , crotb," & " , xrotb
print "blaub ", ablaub," & " , bblaub," & " , cblaub," & " , xblaub
print "lampe ", alampe," & " , blampe," & " , clampe," & " , xlampe
print "lampeb ", alampeb," & " , blampeb," & " , clampeb," & " , xlampeb
print "sonne ", asonne," & " , bsonne," & " , csonne," & " , xsonne




