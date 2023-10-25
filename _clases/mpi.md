---
layout: lecture
date: 2023-03-04
title: MPI
description: Message Passing Interface.
ready: true
---

> MPI es una especificación para desarrolladores y usuarios de librerias de pasaje de mensajes. Su objetivo es ser una interfaz práctica, portable, eficiente y flexible. Una gran ventaja de MPI es que está **adaptada para cualquier arquitectura de memoria** (distribuida, compartida e híbrida). Implementaciones de MPI: MPICH, OpenMPI, Intel MPI. Tiene soporte para C, C++ y Fortran. 

Para invocar la libreria usamos:

| C | fortran |
|---|---|
|`#include "mpi.h"`|`include 'mpif.h` |

Luego la sintaxis es casi idéntica para C/C++ y Fortran. En C, los comandos siguen la siguiente sintaxis:
```c
rc = MPI_Xxxxx(param, ...)
```

En fortran la sintaxis es:
```fortran
call MPI_XXXXX(param,..., ierr)
```

### Ejemplo simple:

Un programa  *hola mundo* paralelizado con MPI en fortran sería:

```fortran
program hola
    implicit none
    integer :: ierr

    include 'mpif.h'

    !Código serial...
    call MPI_INIT(ierr)
        print '("Hola mundo!")'
    call MPI_FINALIZE(ierr)
    !Código serial...
end program
```

Para compilarlo: 
```shell
$> mpif90  hola_mundo.f 
```

Luego lo ejecutamos así:
```shell
$> mpirun -np 4 a.out 
```

### Comunicadores, Grupos y `rank`

MPI usa unos objetos llamados **comunicadores** (`comm`) y **grupos** (`group`) para definir que colección de procesos se comunican con otros.

Los *comunicadores* definen un *grupo* de procesos que tienen la capacidad de comunicarse entre si. En este grupo a cada proceso se le asigna un `rank` único (también llamado *task ID*) que le permite comunicarse explicitamente con el resto.

La mayoría de las rutinas de MPI requieren que se especifique el comunicador como argumento.
Hay un type `MPI_Comm` y hay un comunicador predeterminado `MPI_COMM_WORLD`.


Dentro de cada comunicador, cada proceso tiene su propio y único identificador. Cuando un proceso se inicia un identificador (un número entero) es asignado por el sistema. A los rangos aveces tambien se los llaman *task ID*. Los rangos son contiguos y empiezan en 0.

La comunicación se basa en operaciones de envio (`send`) y recepción (`receive`) entre procesos.

Se utilizan para especificar el origen y destino de los mensajes. Comunmente se usa condicionalmente por la aplicación para controlar la ejecución del programa (so rank==0 hacer esto / si rank==1 hacer esto otro) 


#### Manejo de Errores
Generalmente las rutinas MPI retornan un parametro de error, sin embargo el comportamiento standard de MPI es abortar si un error ocurre.


### Rutinas de manejo de ambiente:

Principales rutinas en MPI:
+ `MPI_INIT(*ierr*) `: Inicia ambiente de ejecución.
+ `MPI_FINALIZE(*ierr*)`: Termina la ejecución de MPI.
+ `MPI_COMM_SIZE(*comm, size, ierr*)` Retrona el numero de procesos especificados en el comunicador.
+ `MPI_COMM_RANK(*comm, size, ierr*)` Retorna el rango del comunicador.

Otras rutinas:
+ `MPI_ABORT(*comm,errorcode,ierr*)` Finaliza el proceso asociado al comunicador.
+ `MPI_GET_PROCESOR_NAME(*name, resultlength,ierr*) ` Retorna el nombre del proceso y el tamaño del nombre.
+ `MPI_GET_VERSION(*version, subversion, ierr*) ` Devuelve la version de MPI que está siendo implementada por al librería.
+ `MPI_INITIALIZED(*flag, ierr*) ` Indica si l `MPI_INIT` ha sido llamada. (`flag` es un booleano)
+ `MPI_WTIME() ` Retorna el tiempo transcurrido  (en segundos) en la llamada al proceso.
+ `MPI_WTICK() ` retorna la resolución en segundos de `MPI_Wtime`.


## Comunicación punto a punto
Comunicación entre dos tasks distintos. Un task realiza la operación de envío y el otro la de recepción.
Hay distintos tipos de rutinas de envío y recepción usadas para distintos propositos. Por ejemplo:
  + Envío sincorizado
  + Envío/recivo bloqueador
  + Envío amortiguado
  + Envío/recivo combinado
  + Envío *"Ready"*

Cualquier tipo de rutina de envío está asociada a una de recivo.

MPI también provée rutinas asociadas a operaciones envío-recivo tal como aquellas usadas para mensajes de espera de arrivo ó probar si un mensaje ha llegado.


#### Buffering
Idealmente, toda operación de envío está perfectamente sincronizada con la operación de recibo. Esto raramente ocurre. De alguna forma u otra MPI tiene que ser capaz de manejarse con datos almacenados cuando un dos tasks están fuera de sincronía.

Por ejemplo:
  + Una operación de envío ocurre 5 segundos antes de que la recepción esté lista. Dónde se almacena el mensaje hsata que la recepción está lista?
  + Multiples envíos llegan al mismo task receptor que solo puede aceptar una a la vez. Que pasa con los mensajes en espera?
  
MPI decide que pasa con estos datos. Tipicamente hay un area buffer del sistema reservada para sostener el transito.

El espacio buffer:
+ No está a la vista del usuario (lo maneja la librería MPI).
+ Usa recursoss finitos.
+ Suele ser misterioso y no bien documentado.
+ Puede existir en el emisor, receptor ó ambos.
+ Tiene un impacto en la performance ya que habilita que la comunicación sea asincrónica.


#### Blocking
Las rutinas de MPI *point-to-point* puedn ser usadas en modo *blocking* ó *non-blocking*.
  + **Blocking**
    + Una rutina de envío no *vuelve* hasta que esté a salvo de modificar los datos envíados para reusarse. A salvo significa que no afecta la información que debe ser recibida por el task.
    + Puede ser sincrónica ó asincrónica.
    + Una recpeción bloqueada solo vuelve luego de que la información haya llegado y esté lista para ser usada por el programa.

  + **Non-blocking**
    + Las rutinas emisión y recepción no bloqueadas se comportan similar. Estas vuelven inmediatamente. No esperan a ningun evento de la comunicación para completarse.
    + Estas rutinas simplemente le piden a la librería de MPI que haga alguna operación cuando esté disponible.
    + No es un seguro modificar el buffer (el espacio de variables) hasta que uno sepa feacientemente que el pedido de una operación *non-blocking* haya sido efectuada por la librería. Para ello existen rutinas de *espera*.
    + Estas operaciones se realizan principalmente para superponer computación con comunicación y explotar las posibles ganancias en performance.

#### Orden & Fairness
**Orden**
    + MPI garantiza que los mensajes no se adelanten los unos a los otros.
    
**Justicia / Fairnes**
      + MPI no garantiza *justicia*, esto quiere decir que si dos tasks envían una señal al mismo taks, entonces sólo uno de los mensajes se completará.


#### Rutinas y argumentos

Las comunicaciones punto a punto (por ejemplo `MPI_Send` y `MPI_Recv`) generalmente tienen la siguiente lista de argumentos:

+ `**buffer**`  address space del programa que referencia los datos a ser enviados ó recibidos. En muchos casos es simplemente el nombre de la variable que es enviada/recibida.
+ `**count** `  Indica el numero de elementos que son eviados.
+ `**type**`    Por razones de portabilidad MPI predefine sus propios *data types*, para fortran los más importantes son: `MPI_LOGICAL`, `MPI_INTEGER`, `MPI_REAL`, `MPI_DOUBLE_PRECISION`, `MPI_COMPLEX`, `MPI_CHARACTER`.  
+ `**dest**`   (*destino*) Se especifica como el rango del proceso recibido.
+ `**source**` (*origen*) Se especifica como el rango del proceso enviado.
+ `**tag**`    Numero arbitrario entero no negativo, asignado por el programador para identificar el mensaje univocamente.
+ `**comm**`   El comunicador.
+ `**status**` Para una operación de recepción indica el origen del mensaje y el tag del mismo. En fortran es un array de enteros de tamaño `MPI_STATUS_SIZE()`
+ `**request**` Para emision/recepción no bloquada, ya que estas operaciones pueden volver antes de que el pedido de sistema de buffer space sea obtenido. Puede ser utilizado en las rutinas de `WAIT` para determinar si la operación fue completada. En fortran es un entero.

Ejemplos:

|--------------------------------------------------------------------------------------------|
| *emisión bloqueada*      | `MPI_SEND ( *buffer, count, type, dest, tag, comm* )          ` |
| *emisión no bloquada*    | `MPI ISEND( *buffer, count, type, dest, tag. comm, request* )  `|
| *recepción bloqueada*    | `MPI_RECV ( *buffer, count, type, source, tag, comm, status* )` |
| *recepción no bloqueada* | `MPI_IRECV( *buffer, count, type, source, tag, comm, request* )`|
|--------------------------------------------------------------------------------------------|

### Rutinas de paso de mensajes

** Bloqueadas **
 + `MPI_SEND(*buf, count, type, dest, tag, comm, ierr *)`
 + `MPI_RECV(*buf, count, type, source, tag, comm, status, ierr*)`
 + `MPI_SSEND(* *)`
 + `MPI_SENDRECV(* *)`
 + `MPI_WAIT(* *)`
 + `MPI_WAITANY(* *)`
 + `MPI_WAITALL(* *)`
 + `MPI_WAITSOME(* *)`
 + `MPI_PROBE(* *)`
 + `MPI_GET_COUNT(* *)`
 

** No-Bloqueadas **
 + `MPI_ISEND(*buf, count, type, dest, tag, comm, request, ierr *)`
 + `MPI_IRECV(*buf, count, type, source, tag, comm, request, ierr*)`
 + `MPI_ISSEND(*buf, count, type, dest, tag, comm, request, ierr*)`
 + `MPI_TEST(* *)`
 + `MPI_TESTANY(* *)`
 + `MPI_TESTALL(* *)`
 + `MPI_TESTSOME(* *)`
 + `MPI_IPROBE(* *)`

---

## Comunicación colectiva

La comunicación colectiva involucra a todos los procesos en el alcance del comunicador. 
  + Todos los procesos por default son miembors del comunicador `MPI_COMM_WORLD`.
  + Se pueden definir comunicadores adicioneles.
  + Comportamientos inesperados, incluyendo falla del programa, pueden ocyrrur su un task en el comunicador no participa.
  + Es responsabilidad del usuario asegurarse de que todos los procesos en un comunicador participen de cualquier operación colectiva.


Tipos de Operaciones colectivas:
+ **Sincronización.** esperar a que todos los miembros del grupo hallan alcanzado el punto de sincronización.
+ **Movimiento de datos.** distribuir (brodcas)t, distribuir en partes (scatter), reunir (gather), todo a todos (all to all).
+ **Computación colectiva.** (reducciones) Un miembro del grupo colecta datos del restro y realizauna operación (min, max, suma, multiplicar, etc.) con todos los datos.

### Rutinas de comunicación colectiva:
+ `MPI_BARRIER (*comm*)`
+ `MPI_BCAST (*buffer, count, type, root, comm, ierr *)`
+ `MPI_SCATTER (*sendbuff, sendcount, sendtype, recvbuff, recvcount, recvtype, root, comm, ierr *)`
+ `MPI_GATHER (*sendbuff, sendcount, sendtype, recvbuff, recvcount, recvtype, root, comm, ierr *)`
+ `MPI_ALLGATHER (*sendbuff, sendcount, sendtype, recvbuff, recvcount, recvtype,  comm, info *)`
+ `MPI_REDUCE (* sendbuff, recvbuff, count, datatype, op, root, comm, ierr*)`, donde op puede ser: `MPI_MAX`,`MPI_MIN`, `MPI_SUM`, `MPI_PROD`, entre otras (uno puede definir su propia función de reducción utilizando ` MPI_OP_CREATE()`).

+ `MPI_ALLREDUCE (*sendbuf, recvbuf, ciybtm datatype, op, comm, ierr*)`
+ `MPI_REDUCE_SCATTER (*sendbuf, recvbuf, recvcount, type, op, comm, ierr *)`
+ `MPI_ALLTOALL (* sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, ierr*)`
+ `MPI_SCAN (*sendbuf, recvbuf, count, type, op, comm, ierr *)`


## Grupos y Comunicadores

Un **grupo** es un conjunto de procesos ordenados. Cada proceso en un grupo está asociado con un único rango entero. Los valores de rangos comienzan en 0.  Los grupos son representados como un objeto en un sistema de memoria.  Son solo accesibles por el usuario a 'mano'. Todo objeto está asociado a un objeto comunicador.

Un **comunicador** engloba a un grupo de procesos que pueden comunicarse entre ellos. Todos los ensajes MPI deben especificar al comunicador. En el sentido más simple el comunicado es un *tag* extra que debe incluirse en las llamadas de MPI. Como en los grupos, los comunicadores está  representados como un objeto en un sistema de memoria y son solo accesibles manualmente.

Desde el punto de vista del usuario, un grupo y un comunicador son uno. Las rutinas de grupo son principalmente para especificar que procesos deben ser usados para contruir un comunicador.


Principales propositos de grupos y comunicadores:
1. Permitir reconocer tasks, basado en funciones, en grupos de taks.
2. Habilitar operaciones de comunicaciones colectivas a lo largo de un subconjunto de tasks relacionados.
3. Provéer bases para immplementar topologías virtuales definidas por el usuario.
4. Provéer de comunicaciones seguras.

Algunas consideraciones:
+ Los grupos y los comunicadores son dinámicos (pueden ser creados y destruidos durante la ejecución del programa)
+ Los procesos pueden ser en más de un grupo/comunicador. 
+ MPI tiene cerca de 40 rutinas para relacionar grupos, comunicadores y topologías virtuales.
+ Uso típico:
  1. Extraer *handle* de gruop global de `MPI_COMM_WORLD()`
  2. Formar un nuevo grupo como un subconjunto del grupo global usando `MPI_GROUP_INCL()`
  3. Crear nuevo comunicador de un grupo usando `MPI_COMM_CREATE()`
  4. Deternubar ek rango del nuevo comunicador usando `MPI_COMM_RANK()`
  5. Realizar comunicaciones usando alguna rutina de mensajes de MPI
  6. Al terminar, liberar el comunicador/grupo usando `MPI_COMM_FREE()` ó `MPI_GROUP_FREE()`.


### Topologías virtuales

+ Una topología virtual describe un mapeo/ordenamiento de los procesos de MPI en una forma geométrica.
+ Dos topologías principales en MPI son la *cartesiana* (grid) y *grafo*.
+ Las topologías de MPI son virtuales, es decir, no hay una relación entre la estructura física de la maquina paralela y el proceso topológico.
+ Las topologías se construyen en base a comunicadores y grupos de MPI.
+ Deben ser programados por el usuario.

Por qué usarlas:
+ *Conveniencia*. Pueden estar vincualdas a tipo de datos que maneja el problema a resolver. 
+ *Eficiencia en la comunicación*. 
