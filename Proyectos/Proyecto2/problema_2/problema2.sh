#!/bin/bash

DATA=/home/arielh/LXS2_arielh/Proyectos/Proyecto2/Proyecto-de-Programacion/problema2
OUT_DATA=$DATA/datos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos


if [! -d $datos_csv ] | [ ! -d $GRAF_DATA ] | [ ! -d $FULL_DATA ]
then
	mkdir $DATA/datos_csv
	mkdir $GRAF_DATA
	mkdir $FULL_DATA
fi
m=0

for i in `find $DATA -name '*.xls'`
do
	echo "Procesando archivo $i"
	xls2csv $i > $OUT_DATA/bills-$m.csv
	let m=m+1
done 2> error1.log

m=0

for e in `find $OUT_DATA -name "*.csv"`
do
	echo "Dando formato de datos para graficar al archivo $e"
	cat $e | awk -F "\",\"" '{print $2}' | sed '1,$ s/"//g'  > $GRAF_DATA/graf-$m.dat
	let m=m+1
done 2> error2.log


#Este condicional elimina el archivo full.dat ya que si corre varias veces entonces
#se agregaran mas datos al archivo en lugar de crearlo con los datos generados.
#Osea se agregan por cada corrida un duplicado de los mismos datos.

if [ -a $FULL_DATA/full.dat ]
then
	rm $FULL_DATA/full.dat
	echo "Archivo full.dat borrado"
fi 2> errorIf.log


for k in `find $GRAF_DATA -name "*.dat"`
do
	sed '1d' $k >> $FULL_DATA/full.dat
	echo "Procesando archivo $k"
done 2> error3.log


FMT_BEGIN='20110206 0000'
FMT_END='20110206 0200'
FMT_X_SHOW='%H: %M'
DATA_DONE=$FULL_DATA/full.dat

##La linea set xrange que esta comentada deja en manos de gnuplot la seleccion del
##mejor rango en el eje x de forma que aparescan todos los datos. Se la descomentan
##entonces pueden manejar el despliegue de estos a traves de las variables FMT_begin
## y FMT_END. En este caso aparecen todos los datos. Ver fig1.png donde aparecen todos
##los datos yen fig.png solo aparecen los daros del 6 de febrero como lo establecen las 
##las variables.


graficar()
{
	gnuplot << EOF 2> error.log
	set xdata time
	set timefmt "%Y%m%d%H%M"
#	set xrange ["$FMT_BEGIN" : "$FMT_END"]
	set format x "$FMT_X_SHOW"
	set terminal png
	set output 'fig1.png'
	plot "$DATA_DONE" using 1:3 with lines title "sensor1", "$DATA_DONE" using 1:4 with linespoints title "sensor2"
EOF

}
graficar

