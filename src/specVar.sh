#!/bin/bash

####### Primero revisamos que el nuemro de parametros sea el correcto
#-------------------------------------------------- 
#Revision de argumentos

#son tres argumentos
ARGS=3

if [ $# -ne $ARGS ]
then
	echo "Error:"
	echo "Uso: $0 <op1> <op2> <op3>"
	exit 1
fi
#-------------------------------------------------- 

#Quiero ver los argumentos

echo "los parametros del script fueron"
echo " "

VAR1=1
##Diferncia entre $@ (es un arreglo) y $* (que es un string)

for PARAM in $@
do
	echo "el parametro $VAR1 es: $PARAM"
	let "VAR1=$VAR1+1"
	echo "VAR1=$VAR!+1"
done

echo "VAR1 es :$VAR1"

