---
layout: lecture
date: 2023-03-02
title: Optimización
description: Consejos para mejorar Performance.
ready: true
---

> Revisemos formas de mejorar la performance de un programa, sin necesidad de usar librerias ó APIs para paralelizar.

Primero repasemos algunos puntos que serán críticos en la performance de un código:
- Elección del algoritmo: Complejidad (*big-O*): O(1), O(log n), O(n), O(n log n), etc..
- *Estructuras de datos* a usar (stack, queue, array, linked-list, trees, graph, etc.).
- Operaciones a usar: (`+`,`-`,`*`,`/`,`%`,`sqrt`,`**`, etc.)
- Usar software optimizado (si hay disponible).
- Hardware: detectar donde está el cuello de botella.
- Optimizaciones del compilador (se discute con más profundiad abajo).
- Tomar conciencia de la arquitectura de la máquina/cluster.


{%comment%}
## Tomar conciencia de la arquitectura
Una supercomputador es una colección de nodos que se ve masomenos así:

![imgs/supercomputadora_arquitectura.png]()

- Los nodos están interconectados en una red de velocidad finita.
- cada nodo tiene uno ó más CPUs.
- cada CPU puede tener varios nucleos (*cores*).
- las CPUs aceden a la memoria atraves de un *bus* con velocidad finita.
- los *cores* de una CPU comparten memoria de rapido acceso que llamamos *cache*
- algunos nodos tienen acceso directo a interfaz I/O, el resto tienen que atravesar este nodo.
- las CPUs de un nodo tienen acceso a la memoria de otra CPU del mismo nodo, pero demora más.

{%endcomment%}

## Uso del cache


### Cercania espacial
Recordemos que el cache guarda los elementos contiguos en memoria del último valor accedido para explotar el criterio de *spatial locality*, esto puede ser importante a la hora de decidir como haceder a los elementos de un array, donsideremos el siguiente ejemplo:

```fortran
integer, parameter :: n=1000,m=2000
real :: X(n,m), Y(n,M)
real :: a

do i=1,n
   do j=1,m
	Y(i,j)=X(i,j)*a
   enddo
enddo
```
dado a que en fortran los elementos de un array se guardan en forma contigua en la memoria, pero los ordenan desde el indice de la izquierda (ojo, en C es alreves!), entonces en el ejemplo anterior dos sucesivas interaciones van a impliciar que se renueve el cache ya que los elementos (i,j)=(1,1) e (i,j)=(1,2) distan en memoria `m`-elementos. Una forma de optimizar este loop es cambiar el orden de los `do`:

```fortran
do j=1,m
   do i=1,n
	Y(i,j)=X(i,j)*a
   enddo
enddo
```
> Muchas veces el compilador detecta este problema y lo corrije, aún así es bueno tenerlo presente.

### Cercania temporal

Consideremos ahora como explotar el criterio de *temporal locality*, supongamos que tenemos el siguiente loop:

```fortran
real :: A(N), B(N), C(N), D(N), Z(N)
do i=1,n
	A(i)=A(i)*Z(i)
	B(i)=A(i)**2.
	C(i)=C(i)+B(i)
	D(i)=D(i)/3.+C(i)
	Z(i)=Z(i)*D(i)
enddo
```

Notar que para cada iteración el elemento `Z(i)` es utilizado en la primer linea, y luego es usado nuevamente después de 3 operaciones. Es posible que el cache almacene este valor mientras que el resto de los elementos que no son usados se descarten.

Ahora imaginemos que reeplazamos el código por este código equivalente en notación vectorial:
```fortran
real :: A(N), B(N), C(N), D(N), Z(N)

A(:)=A(:)*Z(:)
B(:)=A(:)**2.
C(:)=C(:)+B(:)
D(:)=D(:)/3.+C(:)
Z(:)=Z(:)*D(:)
```
en este caso pasaron 3N+(N-1) instrucciones hasta que un elemento `Z(i)` es reutilizado, en tal caso el cache descarta los valores de Z y el código se ejecuta más lento por que hay *overhead* por acceso de datos, es decir hay más operaciones de llamada a memoria (que es lento).

### cache blocking

Una forma de optimizar los llamados a memoria es reestructurar arrays de forma tal que entren en el cache.
Por ejemplo

Oragnizando el acceso a memoria uno puede cargar en cache pequeños sub-sets de un array grande. La idea es trabajar con ese bloque en el cache, trabajando de a "bloques" se reduce la necesidad de ir a buscar datos a memoria (reduciendo la presión en el ancho de bande de la memoria).
















## Vectorización
La vectorización es una tecnología a nivel del procesador que mejora el rendimiento de loops.
Hay dos tecnicas de vectorización: *pipelining* y SIMD (single instruction multiple data). Vamos a discturi la primera.
about vector pipelining.

### Pipelinig
![./imgs/vectorization_ascensor.png]()


### Inhibidores de vectorización:

- I/O
- loops anidados
- funciones (*procedures*)
- funciones matemáticas
- dependencias
- condicionales


Algo que puede ayudar a la vectorización es **fusionar loops**.


## Memory allocations


### Tipos de memory allocations

|Kind of array	 | Declaration		 | Allocation time        |  Deallocation time   |
|----------------|-----------------------|------------------------|----------------------|
|Static           | Z(100)                | At program launch time |  Never		 |	
|Automatic        | Z(N)                  | At runtime             |  on RETURN		 |
|Dynamic          | ALLOCATABLE :: Z(:)   | When required          |  Manual or on RETURN|
|Pointer          | POINTER :: Z(:)       | When required          |  Manual             |


### Stack vs Heap


---

## Optimizaciones del compilador

El compilador puede realizar distintos tipos de modificaciones en pos de mejorar la performance:

Optimizaciones Escalar:
+ Copy propagation
+ Const folding: `a=100;b=200; suma=a+b ` &rarr; `suma=300`
+ Strength reduction `x=y**2;a=b/2.0`     &rarr; `x=y*y;a=b*0.5`
+ Eliminación subexpresiones comunes `d=c*(a/b);e=(a/b)*2` &rarr; `x=a/b;d=c*x;e=x*2.0`
+ Renombrado de variables: `x=y*z; q=r+x*2; x=a+b` &rarr; `x0=y*z; q=r+x0*2; x=a+b`

Opt. Lazos:
+ Loop invariant: saca de loops operaciones que no dependen del indice.
+ Loop unrolling: 
+ Intercambio orden loop (para explotar *spatial locality*)

Inlining
+ Reemplaza una porción de código por otro equivalente + veloz)
+ Fusion/fision loop

---

## Mejora escalar:

### Optimizacion

### A nivel de compilación:
```bash
gfortran -On programa.f90
```
donde n puede ser:
 - ``-O0``  sin optimizacion. 
 - ``-O1``, ``-O2`` optimizaciones menores, no afectan precision en los resultados.
 - ``-O3`` máximo nivel de optimizacion, puede demorar el tiempo de compilación y afectar la precision de los resultados.

### A nivel de sentencias:
- **Simplificacion de constantes **, evitar variables del tipo ``y=4+8`` (reemplazar por ``y=12``).
- **Evitar condicionales** , en lugar de expresiones del tipo ``IF (i .eq.j .or. i .eq. k)`` usar directamente ``i=j``.
- **Usar registros**, para variables muy usadas, guardarlos en registros.

### A nivel de bloques:
- Eliminar bloques que no se ejecutan.
- Ordenar instrucciones para mejorar el acceso de memoria.

## Mejora paralela:

## Timming


## Caché






### Optimización MIT (Bentley Rules)

#### Data structures
+ Packing and enconding: minimizar la representacion de informacion en variables para intentar mover menos memoria.
+ Augmentation: agregar información extra en variables para facilitar operaciones muy frecuentes.
+ Precomputation: usar valores precalculados para evitar calcularlos durante la ejecución.
+ Compile-time initialization: metaprograming. Hacer pogramas que escriban la inicializacion de grandes tablas para tener cosas precomputadas.
+ Caching: guardar valores recientemente calculados para usarlos y no tener que calcularlos de nuevo.
+ Lazy evaluation:
+ Sparsity: Evitar guardar arrays con muchos ceros.

#### Loops          
+ Hoisting: sacar de loops variables que no son funcion del iterador.
+ Sentinels: 
+ Loop unrolling: reducir el numero de iteraciones iterando por grupos. Reduce cache missing.
+ Loop fusion: Fusionar multiples loops que iteran el mismo rango en un unico loop.
+ Eliminate wasted iterations.

#### Logic          
+ Constant folding and propagation: 
+ Common subexpression elimination:
+ Algebraic identities:
+ Short circuiting:
+ Ordering test
+ Creating fast paths
+ Combining tests

#### Functions      
+ Inlining: 
+ Tail-recursion elimination
+ Coarsering recursion

