#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced

set grid

set xlabel "Wellenlänge in pm"

set ylabel "Intensität Imp/s"

d=201.4e-12


bragg(x)=2.*d*x/(1e-12)

set output "~/fortgeschrittenenpraktikum/Versuch8/spektren.svg"


p "cureferenz.data" u (bragg($1)):($2) w lines title "Kupfer, 33 kV", "fereferenz.data" u (bragg($1)):($2) w lines title "Eisen, 33 kV", "moreferenz.data" u (bragg($1)):($2) w lines title "Molybdän, 33 kV"


set output "~/fortgeschrittenenpraktikum/Versuch8/kupfermin.svg"

p [50:175] [0:500] "cu15-33.data" u (bragg($1)):($2) w lines title "U_{A}=15kV", "cu15-33.data" u (bragg($1)):($3) w lines title "U_{A}=17kV", "cu15-33.data" u (bragg($1)):($4) w lines title "U_{A}=19kV", "cu15-33.data" u (bragg($1)):($5) w lines title "U_{A}=21kV", "cu15-33.data" u (bragg($1)):($6) w lines title "U_{A}=23kV", "cu15-33.data" u (bragg($1)):($7) w lines title "U_{A}=25kV", "cu15-33.data" u (bragg($1)):($8) w lines title "U_{A}=27kV", "cu15-33.data" u (bragg($1)):($9) w lines title "U_{A}=29kV", "cu15-33.data" u (bragg($1)):($10) w lines title "U_{A}=31kV" 


set output "~/fortgeschrittenenpraktikum/Versuch8/kupferges.svg"

set key top center

p "cu15-33.data" u (bragg($1)):($2) w lines title "U_{A}=15kV", "cu15-33.data" u (bragg($1)):($3) w lines title "U_{A}=17kV", "cu15-33.data" u (bragg($1)):($4) w lines title "U_{A}=19kV", "cu15-33.data" u (bragg($1)):($5) w lines title "U_{A}=21kV", "cu15-33.data" u (bragg($1)):($6) w lines title "U_{A}=23kV", "cu15-33.data" u (bragg($1)):($7) w lines title "U_{A}=25kV", "cu15-33.data" u (bragg($1)):($8) w lines title "U_{A}=27kV", "cu15-33.data" u (bragg($1)):($9) w lines title "U_{A}=29kV", "cu15-33.data" u (bragg($1)):($10) w lines title "U_{A}=31kV"


set output "~/fortgeschrittenenpraktikum/Versuch8/molyges.svg"


set key top right

p "mo15-31.data" u (bragg($1)):($2) w lines title "U_{A}=15kV", "mo15-31.data" u (bragg($1)):($3) w lines title "U_{A}=17kV", "mo15-31.data" u (bragg($1)):($4) w lines title "U_{A}=19kV", "mo15-31.data" u (bragg($1)):($5) w lines title "U_{A}=21kV", "mo15-31.data" u (bragg($1)):($6) w lines title "U_{A}=23kV", "mo15-31.data" u (bragg($1)):($7) w lines title "U_{A}=25kV", "mo15-31.data" u (bragg($1)):($8) w lines title "U_{A}=27kV", "mo15-31.data" u (bragg($1)):($9) w lines title "U_{A}=29kV", "mo15-31.data" u (bragg($1)):($10) w lines title "U_{A}=31kV" 


set output "~/fortgeschrittenenpraktikum/Versuch8/molymin.svg"

set key left

p [75:174] [0:1000] "mo15-31.data" u (bragg($1)):($2) w lines title "U_{A}=15kV", "mo15-31.data" u (bragg($1)):($3) w lines title "U_{A}=17kV", "mo15-31.data" u (bragg($1)):($4) w lines title "U_{A}=19kV", "mo15-31.data" u (bragg($1)):($5) w lines title "U_{A}=21kV", "mo15-31.data" u (bragg($1)):($6) w lines title "U_{A}=23kV", "mo15-31.data" u (bragg($1)):($7) w lines title "U_{A}=25kV", "mo15-31.data" u (bragg($1)):($8) w lines title "U_{A}=27kV", "mo15-31.data" u (bragg($1)):($9) w lines title "U_{A}=29kV", "mo15-31.data" u (bragg($1)):($10) w lines title "U_{A}=31kV" 


set output "~/fortgeschrittenenpraktikum/Versuch8/eisenmin.svg"


p [30:90] [0:350] "fe15-31.data" u (bragg($1)):($2) w lines title "U_{A}=15kV", "fe15-31.data" u (bragg($1)):($3) w lines title "U_{A}=17kV", "fe15-31.data" u (bragg($1)):($4) w lines title "U_{A}=19kV", "fe15-31.data" u (bragg($1)):($5) w lines title "U_{A}=21kV", "fe15-31.data" u (bragg($1)):($6) w lines title "U_{A}=23kV", "fe15-31.data" u (bragg($1)):($7) w lines title "U_{A}=25kV", "fe15-31.data" u (bragg($1)):($8) w lines title "U_{A}=27kV", "fe15-31.data" u (bragg($1)):($9) w lines title "U_{A}=29kV", "fe15-31.data" u (bragg($1)):($10) w lines title "U_{A}=31kV" 


set output "~/fortgeschrittenenpraktikum/Versuch8/eisenges.svg"

set key left

p "fe15-31.data" u (bragg($1)):($2) w lines title "U_{A}=15kV", "fe15-31.data" u (bragg($1)):($3) w lines title "U_{A}=17kV", "fe15-31.data" u (bragg($1)):($4) w lines title "U_{A}=19kV", "fe15-31.data" u (bragg($1)):($5) w lines title "U_{A}=21kV", "fe15-31.data" u (bragg($1)):($6) w lines title "U_{A}=23kV", "fe15-31.data" u (bragg($1)):($7) w lines title "U_{A}=25kV", "fe15-31.data" u (bragg($1)):($8) w lines title "U_{A}=27kV", "fe15-31.data" u (bragg($1)):($9) w lines title "U_{A}=29kV", "fe15-31.data" u (bragg($1)):($10) w lines title "U_{A}=31kV" 

set output "~/fortgeschrittenenpraktikum/Versuch8/duane.svg"

set xlabel "1/U_{B} in 1/kV"


set format x "%.0s*10^{%T}"
set format y "%.0s*10^{%T}"

set ylabel "minimale Wellenlänge/m"


f(x)=1.2398*1e-6*x

moly(x)=moa*x
cu(x)=cua*x
fe(x)=fea*x


fit moly(x) "fit.data" u (1/(($1)*1e3)):(1e-12*($4)) via moa
fit fe(x) "fit.data" u (1/(($1)*1e3)):(1e-12*($2)) via fea
fit cu(x) "fit.data" u (1/(($1)*1e3)):(1e-12*($3)) via cua

p "fit.data" u (1/(($1)*1e3)):(1e-12*($2)) title "Eisen" , f(x) title "Wellenlänge(1/U_{B})", "fit.data" u (1/(($1)*1e3)):(1e-12*($3)) title "Kupfer", "fit.data" u (1/(($1)*1e3)):(1e-12*($4)) title "Molybdän" , moly(x) title "Fit für Mo", cu(x) title "Fir für Cu", fe(x) title "Fit für Fe"

c=299792458.
e=1.60217657*1e-19

hmo=moa/c*e
hcu=cua/c*e
hfe=fea/c*e

print "eisen: ",hfe
print "kupfer: ",hcu
print "moly: ", hmo
