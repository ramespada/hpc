#!/bin/bash


#awk '{print "Hola mundo!"}' ;


#Sintaxis general

#awk {pattern} {action} input_file

#Uso de variables:

cat << EOF > my_file 
This is a test
This is the second test
This is the third test
This is the fourth test
EOF

awk '{print $1}' my_file

awk -v nombre=Juan -v apellido=Perez '{print "hola, mi nombre es "nombre", y mi apellido es "apellido"."}'

#Algunas Opciones:
#	-f progfile	para cargar script de awk
#	-F fs		separador de campos
#	-v var=val	asignar valor a variables
#	-d[file]	variables desde archivo?
#	-D[file]		--debug[=file]
#	-e 'program-text'	--source='program-text'
#	-E file			--exec=file
#	-i includefile		--include=includefile
#	-l library		--load=library
#	-p[file]		--profile[=file]
#	-r			--re-interval
#	-S			--sandbox


#Busqueda con expresiones regulares

awk '$3~/a/ {print $0}' my_file

#Substituciones
cat my_file | awk 'sub(/this/,"that")'





#Encabezado y pie

awk 'BEGIN {print "File HEADER"}
 
{print $0}
 
END {print "File FOOTER"}' my_file
