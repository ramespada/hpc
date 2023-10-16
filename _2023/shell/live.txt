#!/bin/bash
#La terminal es un programa que nos permite interactuar con el sistema operativo en tiempo real atraves de comandos que escribimos con el teclado en la pantalla.

#===    BASICO    ===
#ABRIR TERMINAL : 
# 	ctl + alt + T

#PROMPT:
# username@pcname:dir$

date
cal

uname

uname -s
uname -n
uname -r
uname -v
uname -o

uname -a

uname --help

clear







#==  NAVEGACION  ==
pwd
ls
ls Desktop
ls -l
ls -a


cd Desktop
cd ..
cd ../..
ls
cd /
cd ~
cd usr/ram



















#==  DIRs / FILES  ==
mkdir carpeta1
mkdir carpeta2
ls

rmdir carpeta2
ls

cd carpeta1
ls
mkdir carpeta
touch archivo1
touch archivo2
touch archivo3
ls

rm archivo3
ls
cp archivo2 carpeta/archivo2
ls carpeta

mv archivo2 carpeta/archivo2
ls 
ls carpeta
mv archivo1 archivo
ls

rm carpeta	#Error!
rm -r carpeta
ls




#==   I/O   ===
#Todos los comandos toman un input, y devuelven un output.
#Vamos a llamar a los inputs que damos con el teclado stdin y a los outputs que se muestran en pantalla stdout
echo "Holaa"
cat
Hola, todo bien?
#	Redireccion
cat > animales
	topo
	pez
#ctrl + C/D
cat animales
cat animales > animales2
cat >> animales2
	oso
	leon
cat animales2
diff animales animales2

cat archivo_animales | sort
echo "Hola, como va?" | tee archivo
cat archivo

echo "archivo" | rm 	#Error!
echo "archivo" | xargs rm









#===	EDICION DE TEXTOS ===

#	Ver contenido de archivo de texto
cat archivo_animales2
head archivo_animales2
tail archivo_animales2

more ../archivo_largo
less ../archivo_largo

#	Editores avanzados
vim archivo    
nano archivo

#	Editor al vuelo:
sed animales s/a/u/g 


















##===   LINKs   ===
ln archivo linkDuro
ln -s archivo linkSimbolico
vim archivo       #escribir algo
vim linkDuro
vim linkSimbolico #escribir algo
rm archivo
cat linkDuro
cat linkSimbolico
vim archivo #escribir algo
cat linkDuro
cat linkSimbolico






















#=== EXPRESIONES REGULARES ===
ls /bin | grep zip

cat ../src/aermod/aermod.f
wc ../src/aermod/aermod.f
grep PURPOSE src/aermod/*




























#===   BUSQUEDA   ===
locate LinuxCommand

find ~ -name *LinuxCom*
find ~ -type d -name *carp*
find ~ -size +10b -type d -name *carp*




























#===  PERMISOS   ===
cd .. 
ls -l
chmod +x script.sh
./script.sh





























#===  PROCESOS   ===
#	procesos:
ps
ps -a
ps -aux		#
top

#	jobs:
xlogo
xlogo &
ps
jobs
fg jobID
#stop job: ctrl+z
bg jobID

kill PID
killall proceso 
#ctl+C si esta en el fg
#	memoria:
free
df












#===  EXPLORAR NUEVOS COMANDOS  ===
ls /bin
ls /usr/bin

whatis ping

apropos "viewer"
#(GOOGLE)


























#=== misc ===

	#PERMISOS
	#PACKAGE MANAGEMENT
	#STORAGE MEDIA
	#NETWORKING
	#COMPRESSION & BACKUP
	
	#> TEXT EDITION 	(vim)
	#> REGEX		(regexp)
	#> BASH SCRIPTING	(bash)
	#> COMPILACION		(make)

