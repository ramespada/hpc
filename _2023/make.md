---
layout: lecture
date: 2023-02-01
title: Makefiles
description: Compilar progrmas usando Makefiles
ready: true
---

# Makefiles

> make es una herramienta para mantener y gestionar programas complejos. Esta herramienta determina automáticamente que partes de un programa necesita ser recompilado e invoca comandos para su recompilación.

El programa `make` lee las instrucciones de un archivo de texto llamado `Makefile`.
El `Makefile` contiene una serie de *reglas* que determinan que las dependencias de las distinas partes del programa para ser recompialado.

`make` permite atuomatizar el proceso de construir un programa y realizar otras acciones con dependencias.

Un `Makefile` contiene:
+ relgas de dependencia
+ macros 
+ reglas implicitas (sufijos)



## Reglas de dependencia

Un makefile consiste en una serie de reglas con la siguiente estructura:
```make
target: prerequisitos
	comando
	comando
	comando
```

El `target` es el nombre de un archivo separado por espacios, tipicamente hay uno por regla. Los `prerequisitos` son tambien nombres de archivos separados por espacios. Estos archivos deben existir para que se ejecuten los comandos.
Los comandos son lineas de ejecución con sintaxis de shell que generalmente involucra a los `prerequisitos` y suelen ser usadas para crear el `target`.



### Ejemplo 1: "Hola Mundo!"

Creemos un `Makefile` con el siguiente contenido:
```make
hola:
	echo "Hola mundo!"
```
En este ejemplo tenemos un target, sin prerequisitos, y un comando. Para ejecutar el `Makefile` escribimos:

```shell
$ make
echo "Hola mundo!"
Hola mundo!
```
vemos que se imprime el comando, y también se ejecuta el comando. 

Si queremos que se imprima el mensaje, pero no el comando, tenemos que agregar en el Makefile el simbolo de `@` antes del comando:
```make
hola:
	@echo "Hola mundo!"
```
Si volvemos a ejecutarlo va a mostrar el mensaje "Hola mundo!" y va continuar haciendo lo mismo, siempre y cuando no exista el archivo `hola`. Veamos que ocurre si por ejemplo cremos un archivo `hola` y luego ejecutamos `make`:

```shell
$ touch hola
$ make
make: 'hola' is up to date.
```
nos dice que `hola` está actualizado, ya que el archivo objetivo existe y sus depndencias/prerequisitos (en este caso niguno) no han sido alterados desde su creación.


### Ejemplo 2: Compilación de un programa

Imaginemos que tenemos un programa en `C` que consiste en dos archivos: `main.c` y `scale.c` cuyo contenido es:

```shell
$ cat main.c
#include <stdio.h>
int scale(int x);
int main(){
	int x=5,y;
	y=scale(x);
	printf("scale(%d)=%d\n",x,y);
	return 0;
}
$ cat scale.c
int scale(int x){
	return(5*x);
}
```

Notar que `main.c` depende usa la función `scale` de `scale.c`.

Si quisieramos compilar este programa tendramos que realizar los siguientes pasos:
```shell
$ gcc -o main main.c scale.c
```
ó alternativamente:
```shell
$ gcc -c main.c	
$ ls                      #verificamos que se creo main.o
main.c  main.o  scale.c
$ gcc -c scale.c
$ ls                      #verificamos que se creo scale.o
main.c  main.o  scale.c  scale.o
$ gcc -o main main.o scale.o
$ ls                      #verificamos que se creo main
main main.c  main.o  scale.c  scale.o
```
esta segunda opción es más eficientes cuando trabjamos con programas grandes. Esto se debe a que en las primeras lineas estamos compilando el programa y creando los archivos `*.o` que son programas compilados pero no linkeados, mientras que el ultimo comando los linkea.
Compilar es un proceso lento, y linkear programas compilados un proceso rápido. Si realizamos una modificación en un módulo del programa, no tiene sentido volver a compilar todo cuando podríamos mejor recompilar solo el módulo modificado y luego linkear todo junto.

Dicho esto, se puede ver que si bien la segunda alternativa es conveniente, es tedioso y cuando un programa se vuelve complejo hay que considerar constantemente cuales son las dependencias entre módulos. Una solución a esto es usar `Makefiles`:

```make
main: main.o scale.o
	gcc -o main main.o scale.o
main.o: main.c
	gcc -c main.c
scale.o: scale.c
	gcc -c scale.c
```

Luego para compilar el programa solo necesitamos ejecutar `make`.

Es muy común que los `Makefiles` contangan una regla llamada `clean` que borre automaticamente todos los archivos intermedios creados en la compilación, de manera que si alguien quiere compilar en una computadora con otras características pueda realizar el procedimiento completo de compilación y no queden archivos remanentes que puedan generar errores.

```make
main: main.o scale.o
	gcc -o main main.o scale.o
main.o: main.c
	gcc -c main.c
scale.o: scale.c
	gcc -c scale.c
clean:
	rm main main.o scale.o 
```

notar que `clean` no tiene prerequisitos, para ejecutar esa regla:

```shell
$ make clean
$ ls
main.c Makefile scale.c
```

Por último, supongamos que queremos compilar el programa con algun flag en particular, por ejemplo `-g`, para esto podemos definir una variable antes de las reglas de la siguiente forma:
```make
CFLAGS= -g
main: main.o scale.o
	gcc $(CFLAGS) -o main main.o scale.o
main.o: main.c
	gcc $(CFLAGS) -c main.c
scale.o: scale.c
	gcc $(CFLAGS) -c scale.c
clean:
	rm main main.o scale.o 
```


## Sintaxis:


Asignaciones:
+  `=` (asignación):`SRCS = main.c`
+ `:=` (expansión):`SRCS := $(wildcard *.c)`
+ `:=` (expansión):`SRCS := $(shell find . -name '*.c')`
+ `:=` (expansión):`SRCS := $(BAR) # Comment`
+ `!=` (shell output):`SRCS != find . -name '*.c'`
+ `+=` (append to):`CC_FLAGS += -Wextra`
+ `?=` (asignación condicional):`CFLAGS ?= $(CC_FLAGS)`

Funciones:
+ `$(SRCS:.c=.o)` reemplaza ".c" por ".o" en SRCS
+ `$addprefix build/,$(OBJS))` agrega "build/" a todos los archivos en OBJS
+ `$(if ..) $(or ..) $(and..)`
+ `$(foreach var, list,text )`
+ `$(value (VARIABLE))`
+ `$(shell ..)`
+ `$(error ..)`
+ `$(warning ..)`
+ `$(info ..)`


### Variables automáticas
Nomenclatura dentro de un comando:
+ `$@`: current target (útil cuando hay muchos target)
+ `$<`: primer prerequisito.
+ `$^`: todos los prerequisitos.
+ `$?`: prerequisitos que hayan sido modificados.
+ `$|`: prerequisitos *order-only*


### `.PHONY`
`.PHONY: target` lo que hace es avisar a make que `target` no es un archivo y por lo tanto sirve para marcar reglas cuyo objetivo no es generar un archivo `target` sino simplemente ejecutar algunos comandos.

### Dependencia automática

