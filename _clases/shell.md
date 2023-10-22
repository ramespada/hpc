---
layout: lecture
date: 2023-01-01
ready: true
title: Shell
description: Sintaxis básica de shell (bash)
nav_order: 1
---

> El shell o terminal, es el programa que nos permite interactuar en tiempo real con el sistema operativo atraves de entradas que damos desde el teclado. Casi todos las distros de Linux usan una sintaxis basada en un proyecto GNU llamado **bash** para la linea de comandos. En sistemas Mac la sintaxis es casi identica, y Windows la esta empezando a adpotar.


## Comandos

La *shell* consiste basicamente en una seríe de comandos (que en general son programas en C/C++ ya compilados, es decir ejecutables) que están disponibles para el usuario. La mayoria de los comandos tienen la siguiente sintaxis:

```shell
mi_comando -opc1 -opc2 ... -opcN <arg1> <arg2> ... <argN>
```
donde `mi_comando` es el comando que queremos ejecutar. `-opc` son opciones de ejecución (tambien conocidas como *flags*), y `arg` son los argumentos del comando a ejecutar.


## Comentarios

Los comentarios son partes de código ó comandos que no se ejecutan. En el caso de la *shell* estos están antecedidos del caracter **`#`**, por ejemplo:

```shell
# Esta linea es un comentario
```

Todo lo que sigue al simbolo **`#`** no hace absolutamente nada. No es algo demasiado útil en el contexto del *shell* (aunque sí en otros contextos), pero en este tutorial se van a usar bastante así que valía la pena mencionarlo.


## Estructura de directorios en UNIX

Los sistemas UNIX suelen tener una estructura de directorios (carpetas) bastante similar entre sí, acá vamos a describir solo los que nos incumben:

+ `/`: Este es el directorio *base* ó *root* del arbol de archivos.
+ `/bin`: Acá se almacenan los *binarios* ó ejecutables, por ejemplo muchos de los comandos de la *shell* están acá dentro.
+ `/home`: Contiene el los directorios base de los usuarios.
  - `/home/<usuario>`: Carpeta donde están todos los archivos del usuario.
+ `/lib`: Contiene librerias del sistema.
+ `/usr`: Contiene ejecutables, librerias, y archivos copartidos.
  - `/usr/bin`: Archivos binarios compartidos entre usuarios. 
  - `/usr/include`: *headers* compartidos entre usuarios (usados por programas de C/C++).
  - `/usr/lib`: librerias comaprtidas entre usuarios.

## Prompt
Cuando abras la terminal (con ``ctrl``+``T``) te vas a encontar con algo asi:
```shell
usuario@pc:mi_dir$
```

Esto se conoce como **promt**, antecede siempre al cursor, y nos da alguna informacion de cual es nuestro estado.
Lo primero que dice es quien es el usuario que va a ejecutar las instrucciones (*usuario*), luego del **`@`** dice desde que computadora (*mipc*), seguido de **`:`** dice el directorio en el que estamos ubicados dentro de *pc*, y por ultimo un signo que indica los privilegios del usuario (**`$`**: usuario normal, **`#`**:superuser/admin).
El prompt es completamente customizable y por lo tanto es posible encontrar otras estructuras, pero en general por default tienen estos elementos.

## Navegación
Veamos como navegar en LINUX, esto es ir de una carpeta a otra y revisar el contenido.

Para conocer la ubicacion absoluta en la que estamos (la del prompt es relativa a la carpeta principal del usuario) utilizamos:
```shell
usuario@pc:~$ pwd
/home/usuario
```

Si queremos ver el contenido de la carpeta entonces escribimos:
```shell
usuario@pc:~$ ls	#muestra contenido del directorio, probar con opciones: -a -l
Desktop  Documents  Music  Pictures  Public  Templates Videos
```

Para cambiar de directorio:
```shell
usuario@pc:~$ cd Desktop        #ir a directorio "Desktop"
usuario@pc:~/Desktop$ cd ..	#volver a directorio madre
```

Para borrar la pantalla de comandos escribimos:
```shell
usuario@pc:~$ clear	#limpia pantalla 
```
> una alternativa de `clear` es `<ctl>+l`

## Directorios y archivos
Veamos como crear/borrar directorios y archivos:

Para crear/borrar una carpeta existen los siguientes comandos:
```shell
usuario@pc:~$ mkdir carpeta		#crea directorio
usuario@pc:~$ rmdir carpeta		#elimina directorio
usuario@pc:~$ rm -r carpeta		#elimina directorio y todo su contenido (OJO!!)
```

Para crear/borrar un archivo:
```shell
usuario@pc:~$ touch archivo		#crea archivo/actualiza fecha de acceso
usuario@pc:~$ rm archivo		#borrar archivo
```

Otras acciones que podemos hacer con directorios y archivos son:
```shell
usuario@pc:~$ cp archivo archivo_copiado  #copiar archivo 
usuario@pc:~$ mv archivo archivo_movido   #mover archivo (tambien sirve para renombrar)
usuario@pc:~$ ln -s archivo link_archivo  #crear link simbolico ("acceso directo")
```

## I/O
Muchos de los comandos utilizados hasta ahora generan un output de algun tipo. 
Estos outputs consisten en dos tipos:
	- resultados que el programa esta diseñado a producir (*stdout*)
	- mensajes de estado y error  (*stderr*)

Por ejemplo en linux, `ls` manda sus resultados a un archivo especial llamado *stdout*, y su status a otro llamado *stderr*. Ambos estan linkeados por default con la pantalla.

Ademas muchos programas toman sus argumentos de un *stdin*, por default linkeado a las entradas desde el teclado.

## Redireccion de stdout stdin
Las salidas de los comandos por default generalmente van a la pantalla, y los inputs se toman desde el teclado.
Sin embargo podemos decidir donde llevar los stdin/stdout utilizando comandos de redireccion:

```shell
usuario@pc:~$ echo "Hola"		   #stdin   a  stdout
usuario@pc:~$ read var			   #stdin   a  var
usuario@pc:~$ cat > archivo 		   #stdin   a  archivo
usuario@pc:~$ cat archivo >> archivo 	   #archivo a  archivo (lo agrega)
usuario@pc:~$ cat animales | sort	   #comando a  comando ("pipe")
usuario@pc:~$ echo "Hola" | tee archivo	   #stdin    a  archivo y stdout ("tee")
usuario@pc:~$ echo "Algo" | xargs mkdir	   #xargs: ejecuta comandos de un standard input (los pasa a argumentos de comandos)
```

## Archivos de texto:
Para ver el contenido de un archivo de texto tenemos varias opciones:

```shell
usuario@pc:~$ cat archivo		#muestra todo el contenido como stdout
usuario@pc:~$ head archivo		#ver primer parte
usuario@pc:~$ tail archivo		#ver última parte
usuario@pc:~$ more archivo		#solo lectura (viejo)
usuario@pc:~$ less archivo  		#version moderna de less  ("more is less" xD)
```

### Editores de texto
Si buscamos un editor de texto con más funciones, algunos de los mas conocidos son:

```shell
usuario@pc:~$ vim archivo		#Editor de textos. (Recomiendo!)
usuario@pc:~$ nano archivo		#Editor de textos.
usuario@pc:~$ emacs archivo		#Editor de textos.
```

### Editores *al vuelo*
Un editor *on the fly* muy utilizado es:

```shell
usuario@pc:~$ sed 's/ioeu/a/g' archivo	#Stream Editor
```

### Expresiones regulares
Las expresiones regulares son formulas abstractas que representan patrones de texto que tienen cierta estructura. Son muy útiles para buscar (y modificar) secuencias de texto dentro de un archivo que siga determinado patron.

Hay distintos comandos para trabajar con expresiones regulares, el mas conocido es ``grep``:

```shell
usuario@pc:~$ ls | grep "*.txt"	# mostrar archivos terminados en ".txt"
```

## Busqueda de archivos
Hay dos comandos principales para buscar archivos:

El primero es ``locate``, busca archivos por su nombre:
```shell
usuario@pc:~$ locate <patron> 	#Busca archivos por nombre en una jerarquia de directorios
```

El comando ``find`` incorpora otras variables para la busqueda:
```shell
usuario@pc:~$ find <patron>   	#Busca en directorio archivos con patron y los lista.
usuario@pc:~$ find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
usuario@pc:~$ find <patron> \(-type d \) -and/-or/-not  \(-size M  \)
usuario@pc:~$ find <patron> -type d/f/l -size b/c/w/k/M/G -name "pattern"
usuario@pc:~$ find <patron> -delete/-ls/-print/-quit
usuario@pc:~$ find <patron> -delete/-ls/-print/-quit -exec ls -l '{}' ';'
```

## Permisos y usuarios
Linux es un sistema operativo *multiusuario*, esto significa que muchos usuarios pueden estar utilizando la misma computadora en simultaneo.
Cada usuario tiene un id, y tiene ciertos privilegios.

```shell
usuario@pc:~$ id 			#ver id de usuario
usuario@pc:~$ users			#ver users
```

Para utilizar la terminal como otro usuario :

```shell
usuario@pc:~$ su - user2		#ingreso a la cuenta de user2 como si fuese el
usuario@pc:~$ su user2		#ingreso a la cuenta de user2, pero como user actual
```

Para realizar operaciones como *super-user*:

```shell
usuario@pc:~$ sudo			#ejecutar comando como superuser
```

## Informacion de archivos
```shell
usuario@pc:~$ file <archivo>	#te muestra tipo de archivo
usuario@pc:~$ stat <archivo>  	#te muestra el estado del archivo
```

Si llamamos a `ls -l` vemos que lista los archvivos en el directorio presente, por ejemplo:
```shell
usuario@pc:~$ ls -l
drwxr-xr-x  8 usuario usuario    69632 may 19 22:55  Desktop
-rw-r--r--  1 usuario usuario     8980 abr  9 12:03  examples.desktop
lrwxrwxrwx  1 usuario usuario       15 may 27 14:43  dni.pdf -> Desktop/dni.pdf
```
La primer secencia de letras y guíones describe el tipo de archivo (primer letra, **d**: directorio, **l**: link, **-** otro.) y el modo ó permisos para usar de cada arcihvo ó directorio (últimos 9 caracteréres, donde: **r**: permiso de lectura, **w**: permiso de escritura, **x**: permiso de ejecucion

El modo queda definido por tres numeros binarios (ó su equivalente hexadecimal). Por ejemplo `Desktop` tiene modo 111 101 101 (es decir: 755) y `examples.desktop` tiene modo 110 100 100 (es decir 644). La forma de leerlo es:

| descr.   | {tipo}|  {user}   | {group}  | {anyone} | 
|:-------- |:-----:|:---------:|:--------:|:--------:| 
| alphanum |   -   | r w x  -  | r w x  - | r w x    | 
| binario  |       | 1 1 1  -  | 0 1 0  - | 1 0 1    | 
| decimal  |       |   7       |   2      |    5     | 


Para modificar el *modo* se utiliza el comando `chmod`:

```shell
usuario@pc:~$ chmod <opcion> <archivo>	#cambiar modo de archivo 
```

```shell
usuario@pc:~$ chmod +x script.sh	#agregar permiso de ejecución a todos.
```

Para cambiar de propetiario y grupo de un archivo se utilizan los siguientes comandos:
```shell
usuario@pc:~$ chown archivo	#change owner (propietario)
usuario@pc:~$ chgrp archivo	#change group 
```

## Procesos
Los sistemas operativos basados en linux son *multi-task*, esto quiere decir que la secuencia de ejecucion de programas la realizan de tal forma que pareciera que se estan realizando multiples tareas en simultaneo (esto es estrictamente asi cuando la computadora posee varias unidades de procesamiento, que hoy en dia es lo mas comun):

Hay distintos comandos que nos dan informacion de los procesos que se estan ejecutando en la computadora:
```shell
usuario@pc:~$ ps	      #muestra snapshot de procesos: -A  -s -ef
usuario@pc:~$ top	      #muestra procesos en tiempo real
usuario@pc:~$ jobs	      #muestra procesos activos
usuario@pc:~$ free	      #memoria libre
usuario@pc:~$ df	      #espacio libre en el disco rigido
```

Para dar/quitar prioridad a un proceso por el resto de los otros:
```shell
usuario@pc:~$ bg		#manda proceso al fondo
usuario@pc:~$ fg		#manda proceso arriba
```
Para terminar un proceso:
```shell
usuario@pc:~$ kill <PID>    # mata proceso (PID)  OJOOO CON ESTO!!
usuario@pc:~$ killall	      #mata proceso por nombre
```

## COMANDOS UTILES:

### Historial de comandos
Con las flechas de direccion (arriba y abajo) podemos revisar comandos ejecutados anteriormente. 
Una forma de ver todo lo que fue ejecutado en la terminal abrierta es con el comando:``history``.
Podemos buscar lineas ejecutadas anteriormente aprentando ``<ctl>+r ``  y escribiendo el patron que se desea buscar.

### Ayuda 	
```shell
usuario@pc:~$ help
usuario@pc:~$ <comando> --help
usuario@pc:~$ help grep	#informacion sobre uso del comando
 
usuario@pc:~$ whatis grep	#te dice que es es el comando
usuario@pc:~$ type grep	#te dice que tipo de comando es
usuario@pc:~$ which grep	#te dice donde se ubica el comando
usuario@pc:~$ apropos copy	#busca una funcion apropiada para "copy"
 
usuario@pc:~$ man grep	#abre documentación de comando "grep"
usuario@pc:~$ info grep	#abre información de comando "grep"
```


### Compresión de archivos
Para comprimir se puede utilizar el programa ``tar``, cuyas opciones principales son ``-c`` para comprimir y ``-x`` para descomprimir. 
```shell 
usuario@pc:~$ tar -cvf comprimido.tar.gz carpeta 
usuario@pc:~$ tar -xzvf comprimido.tar.gz
```

### Manejo de paquetes y librerias
```shell
 apt-get --install <programa>	#instalar programa
	--update		#actualizar sistema
	--upgrade		#
``` 

### Otros
```shell
usuario@pc:~$ sort lista	#ordena lista de strings
usuario@pc:~$ uniq lista	#muestra todos los elementos de la lista sin repetirlos
usuario@pc:~$ split archivo	#divide archivos en partes iguales
usuario@pc:~$ wc archivo	#cuenta palabras del archivo/bits

usuario@pc:~$ diff archivo1 archivo2	#muestra diferencias entre archivos
```

### Ejecutables/programas 
```shell
usuario@pc:~$ ldd <ejecutable>		#lista las dependencias del ejecutable
usuario@pc:~$ ./<ejecutable>			#forma típica de ejecución de binarios.
```

### Informacion del sistema
```shell
usuario@pc:~$ date 	#fecha
usuario@pc:~$ cal	#calendario cool
usuario@pc:~$ uname 	#datos del sistema operativo
usuario@pc:~$ env	#variables de ambiente
```
