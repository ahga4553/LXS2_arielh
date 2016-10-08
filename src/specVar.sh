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
