#!/usr/bin/gnuplot

set terminal svg size 1024,512 enhanced
set grid
set xtics 1

system './auswertung.py'

outputPrefix='histo'
yLabel="Häufigkeit des Messwerts"
xLabel="Messwerte: Anzahl detektierter Myonen"

fn1='14-12-16-14-09.data'

stats 'histo1s'.fn1 u 2
s1=STATS_sum
stats 'histo2s'.fn1 u 2
s2=STATS_sum
stats 'histo5s'.fn1 u 2
s5=STATS_sum
stats 'histo10s'.fn1 u 2
s10=STATS_sum
stats 'histo10s'.fn1 u 1
upperBound=STATS_max

f1(x)=s1*l1**x/int(x)!*exp(-l1)
fit f1(x) 'histo1s'.fn1 u 1:2 via l1

f2(x)=s2*l2**x/int(x)!*exp(-l2)
fit f2(x) 'histo2s'.fn1 u 1:2 via l2

f5(x)=s5*l5**x/int(x)!*exp(-l5)
fit f5(x) 'histo5s'.fn1 u 1:2 via l5

f10(x)=s10*l10**x/int(x)!*exp(-l10)
fit f10(x) 'histo10s'.fn1 u 1:2 via l10

set output outputPrefix.fn1.'.svg'
set ylabel yLabel
set xlabel xLabel
set samples upperBound+1

p [0:upperBound] 'histo1s'.fn1 title "1 Sekunde Messdauer", 'histo2s'.fn1 title "2 Sekunden Messdauer", 'histo5s'.fn1 title "5 Sekunden Messdauer", 'histo10s'.fn1 title "10 Sekunden Messdauer",f1(x) notitle lc 1,f2(x) notitle lc 2,f5(x) notitle lc 3,f10(x) notitle lc 4

system sprintf("echo E1: %f > /tmp/".fn1.".conlusion; echo E2: %f >> /tmp/".fn1.".conlusion; echo E5: %f >> /tmp/".fn1.".conlusion; echo E10: %f >> /tmp/".fn1.".conlusion",l1,l2,l5,l10)

#NEXT FILE

fn1='14-12-16-15-25.data'

stats 'histo1s'.fn1 u 2
s1=STATS_sum
stats 'histo2s'.fn1 u 2
s2=STATS_sum
stats 'histo5s'.fn1 u 2
s5=STATS_sum
stats 'histo10s'.fn1 u 2
s10=STATS_sum
stats 'histo10s'.fn1 u 1
upperBound=STATS_max

f1(x)=s1*l1**x/int(x)!*exp(-l1)
fit f1(x) 'histo1s'.fn1 u 1:2 via l1

f2(x)=s2*l2**x/int(x)!*exp(-l2)
fit f2(x) 'histo2s'.fn1 u 1:2 via l2

f5(x)=s5*l5**x/int(x)!*exp(-l5)
fit f5(x) 'histo5s'.fn1 u 1:2 via l5

f10(x)=s10*l10**x/int(x)!*exp(-l10)
fit f10(x) 'histo10s'.fn1 u 1:2 via l10

set output outputPrefix.fn1.'.svg'
set ylabel yLabel
set xlabel xLabel
set samples upperBound+1

p [0:upperBound] 'histo1s'.fn1 title "1 Sekunde Messdauer", 'histo2s'.fn1 title "2 Sekunden Messdauer", 'histo5s'.fn1 title "5 Sekunden Messdauer", 'histo10s'.fn1 title "10 Sekunden Messdauer",f1(x) notitle lc 1,f2(x) notitle lc 2,f5(x) notitle lc 3,f10(x) notitle lc 4

system sprintf("echo E1: %f > /tmp/".fn1.".conlusion; echo E2: %f >> /tmp/".fn1.".conlusion; echo E5: %f >> /tmp/".fn1.".conlusion; echo E10: %f >> /tmp/".fn1.".conlusion",l1,l2,l5,l10)


#NEXT FILE

fn1='14-12-17-14-04.data'

stats 'histo1s'.fn1 u 2
s1=STATS_sum
stats 'histo2s'.fn1 u 2
s2=STATS_sum
stats 'histo5s'.fn1 u 2
s5=STATS_sum
stats 'histo10s'.fn1 u 2
s10=STATS_sum
stats 'histo10s'.fn1 u 1
upperBound=STATS_max

f1(x)=s1*l1**x/int(x)!*exp(-l1)
fit f1(x) 'histo1s'.fn1 u 1:2 via l1

f2(x)=s2*l2**x/int(x)!*exp(-l2)
fit f2(x) 'histo2s'.fn1 u 1:2 via l2

f5(x)=s5*l5**x/int(x)!*exp(-l5)
fit f5(x) 'histo5s'.fn1 u 1:2 via l5

f10(x)=s10*l10**x/int(x)!*exp(-l10)
fit f10(x) 'histo10s'.fn1 u 1:2 via l10

set output outputPrefix.fn1.'.svg'
set ylabel yLabel
set xlabel xLabel
set samples upperBound+1

p [0:upperBound] 'histo1s'.fn1 title "1 Sekunde Messdauer", 'histo2s'.fn1 title "2 Sekunden Messdauer", 'histo5s'.fn1 title "5 Sekunden Messdauer", 'histo10s'.fn1 title "10 Sekunden Messdauer",f1(x) notitle lc 1,f2(x) notitle lc 2,f5(x) notitle lc 3,f10(x) notitle lc 4

system sprintf("echo E1: %f > /tmp/".fn1.".conlusion; echo E2: %f >> /tmp/".fn1.".conlusion; echo E5: %f >> /tmp/".fn1.".conlusion; echo E10: %f >> /tmp/".fn1.".conlusion",l1,l2,l5,l10)

#NEXT CHAPTER
set xtics autofreq

fn1='14-12-16-15-25.data'

g10(x)=a10*exp(-l10*x)
l10=0.0001
#educatedGuess
#dope
g20(x)=a20*exp(-l20*x)
g50(x)=a50*exp(-l50*x)
g100(x)=a100*exp(-l100*x)
g1000(x)=a1000*exp(-l1000*x)

fit g10(x) 'lifeh10s'.fn1 u 1:2 via a10,l10
a20=a10*2.
l20=l10
fit g20(x) 'lifeh20s'.fn1 u 1:2 via a20,l20
a50=a10*5.
l50=l20
fit g50(x) 'lifeh50s'.fn1 u 1:2 via a50,l50
a100=a10*10.
l100=l50
fit g100(x) 'lifeh100s'.fn1 u 1:2 via a100,l100
a1000=a10*100.
l1000=l100
fit g1000(x) 'lifeh1000s'.fn1 u 1:2 via a1000,l1000

set xlabel "Messwerte: Lebensdauer in ns"

set output 'lifeh10'.fn1.'.svg'
p 'lifeh10s'.fn1 w lines title "Lebensdauer im Szintillator, Messwertintervall: 10s",g10(x) notitle
set output 'lifeh20'.fn1.'.svg'
p 'lifeh20s'.fn1 w lines title "Lebensdauer im Szintillator, Messwertintervall: 20s",g20(x) notitle
set output 'lifeh50'.fn1.'.svg'
p 'lifeh50s'.fn1 w lines title "Lebensdauer im Szintillator, Messwertintervall: 50s",g50(x) notitle
set output 'lifeh100'.fn1.'.svg'
p 'lifeh100s'.fn1 w lines title "Lebensdauer im Szintillator, Messwertintervall: 100s",g100(x) notitle
set output 'lifeh1000'.fn1.'.svg'
p 'lifeh1000s'.fn1 w lines title "Lebensdauer im Szintillator, Messwertintervall: 1000s",g1000(x) notitle

print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
print "Für die Formeln der Fits kannst du ins Skript schauen"
print "Aber im Grunde sind es Poisson für Zählrate und Exponential für Lebensdauer"
print "Erwartungswerte zur Zählrate finden sich in /tmp/[DATEINAME].conclusion"
print "Zählrate=En/Intervallbreite"
print "Erwartungswert der Lebensdauer ist 1/ln, such dir aus, welches l du nehmen willst"
