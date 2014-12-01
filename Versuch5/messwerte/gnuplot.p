#!/opt/local/bin/gnuplot

set terminal svg size 1024,512 enhanced
set grid


e=1.602*1e-19
s=1.18
h=10e-3
b=2e-2
t=1e-3
k=8.6173324e-5

set output "undotiert.svg"
set ylabel "ln(σ/(Sm^{-1}))"
set xlabel "1/T in K^{-1}"
lnleit(x)=m*x+b
fit lnleit(x) "undotiert.data" u (($1+273.15)**(-1)):(log($3*20/($2)))  via m,b
p "undotiert.data" u (($1+273.15)**(-1)):(log($3*20/($2))) title "undotierter Halbleiter", lnleit(x) title "linearer Fit"

set output "hallkonstanten.svg"

set xlabel "B/T"
set ylabel "U_{H}/V"
set key top left

un(x)=rn*x
up(x)=rp*x

fit un(x) "ndotiert.data" u ($1*1e-3):($2*1e-3) via rn
fit up(x) "pdotiert.data" u ($1*1e-3):($2*1e-3) via rp

p [0.01:0.21] "ndotiert.data" u ($1*1e-3):($2*1e-3) title "U_{H}(B), n-Dotierung", "pdotiert.data" u ($1*1e-3):($2*1e-3) title "U_{H}(B),  p-Dotierung" lc 3, un(x) title  "Fit, n-Dotierung" lc 1, up(x) title "Fit, p-Dotierung" lc 3

set output "temperaturkonzentration.svg"
set xlabel "1/T in K^{-1}"
set ylabel "ln(n/m^{3}) bzw. ln(p/m^{3})"
set key top right

ln(x)=x>0 ? log(x) :NaN

p "ndotiertwarm.data" u (1/($1+273.15)):(ln(1/(-$3*h*e/($4*200e-3)))) title "n-dotiert, Konzentration n" lt 6 , "pdotiertwarm.data" u (1/($1+273.15)):(ln(1/($3*h*e/($4*200e-3)))) title "p-dotiert, Konzentration p" lt 4 lc 1

set output "beweglichkeitn.svg"
set ylabel "ln(μ/m^{-2}Vs)"
set xlabel "ln(T/K)"

sortn(x,y)=x<5.95 ? y : NaN
fitn(x)=u*x+v
fit fitn(x) "ndotiertwarm.data" u (ln($1+273.15)):(sortn((ln($1+273.15)),(ln((($4*20)/$2)*(-$3*1e-3*h)/(200e-3*$4*1e-3))))) via u,v

p "ndotiertwarm.data" u (ln($1+273.15)):(ln((($4*20)/$2)*(-$3*1e-3*h)/(200e-3*$4*1e-3))) title "n-dotiert", fitn(x) title "Fit für den Anstieg" 

set output "beweglichkeitp.svg"

sortp(x,y)=x<5.825 ? y : NaN
fitp(x)=z*x+o
fit fitp(x) "pdotiertwarm.data" u (ln($1+273.15)):(sortp((ln($1+273.15)),(ln((($4*20)/$2)*($3*1e-3*h)/(200e-3*$4*1e-3))))) via z,o

p "pdotiertwarm.data" u (ln($1+273.15)):(ln((($4*20)/$2)*($3*1e-3*h)/(200e-3*$4*1e-3))) title "p-dotiert", fitp(x) title "Fit für den Anstieg"

print "E_G von Germanium ", -m*2*k
print "R_H, n-dotiert ", rn
print "R_H, dotiert ", rp
print "n; normal ", -1/(rn*e)
print "p; normal ", 1/(rp*e)
print "n; fixed ", -s/(rn*e)
print "p, fixed ", s/(rp*e)
print "Anstieg, n-dotiert  ", u
print "Anstieg p-dotiert ", z
