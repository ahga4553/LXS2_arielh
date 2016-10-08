#!/bin/bash
# La salida estandar de error estará redireccionada al archivo if-then.sh.err
if cp archivo1.txt arcgivo1.txt.bck 2> $0.err
then
	echo "El archivo.txt fue correctante respaldado..."
fi

