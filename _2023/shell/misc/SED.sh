# Stream EDitor (SED)

# Materiales:
cat > letras
a
b
c
..
h
cat > numeros
1
2
3
..
7
cat > orozcos
Nosotros no somos como los Orozco,
Yo los conozco, son ocho los monos:
Pocho, Toto, Cholo, Tom, Moncho, Rodolfo, Otto, Pololo.
Yo pongo los votos solo por Rodolfo.
Los otros son locos. Yo los conozco.
No los soporto, Stop. Stop.

#Estructura:
sed expresion archivo

#Opciones:
sed --help
#  -n, --quiet, --silent   No muestra resultado
#  -e script, --expression=script add the script to the commands to be executed
#  -f script-file, --file=script-file   add the contents of script-file to the commands to be executed
#  --follow-symlinks  #                 follow symlinks when processing in place
#  -i[SUFFIX], --in-place[=SUFFIX]      reemplaza el resultado en el archivo (IN PLACE)
#  -l N, --line-length=N                especifica numero de lineas a ser procesadas
#  --posix                disable all GNU extensions.
#  -E, -r, --regexp-extended            usar REGEX
#  -s, --separate    #                  consider files as separate rather than as a single,
#  -z, --null-data separate lines by NUL characters

# Remover/Insertar lineas:
sed '5d' numeros

sed '3p' numeros
sed -n '3p' numeros


# Reemplazar:
sed 's/4/a/' numeros
sed 's/[1-4]/a/' numeros
sed 's/.*/&00' numeros

# Concatenar comandos
# Via pipe
sed '5p' numeros | sed '3d'
# Via scripts:
cat script.sed
5p
3d
sed -f script.sed numeros
