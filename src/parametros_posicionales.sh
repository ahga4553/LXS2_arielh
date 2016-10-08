#!/bin/bash

ERRORLO="$0.err"
# La salida estandar de error estará redireccionada al archivo if-then.sh.err

if cp archivo1.txt arcgivo1.txt.bck 2> $0.err
then
	echo "El archivo.txt fue correctante respaldado..."
	echo "Eliminando archivo original"

	if rm archivo1.txt
	then
		echo "El archivo original fue eliminado correctamente.."
	else
		echo "No se puede eliminar el archivo, revisar $ERRORLOG"

	fi
else
	echo "El archivo.txt no pudo ser respaldado, verifique el log: $ERRORLOG"
fi

