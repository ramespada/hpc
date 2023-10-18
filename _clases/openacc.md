---
layout: lecture
date: 2023-03-05
title: openACC
description: Open Accelerator
ready: false
---


# OpenACC 

> Open ACCelerator (*OpenACC*) es un estandar de programación para computación paralela en aceleradores (principalmente GPUs de NIVDIA).

Fue diseñado para simplificar la programación con GPUs. Se basa en insertar comentarios especiales para darle instrucciones a los cores de la GPU.

En  fortran las directivas empiezan con `!$acc *directiva* [ *argumentos, ...* ]`

Ejemplo:

```fortran
  program main
    integer :: n=10000,i
    real :: a=3.0
    real, allocatable :: x(:), y(:)

    allocate(x(n), y(n))

    x=2.0 ; y=1.0

    !$acc kernels
        y(i) = a* x(i) + y(i)
    !$acc end kernels
  end program 
```
Para obtener recursos para GPU:

+ Logearse en BU SCC:  `ssh username@scc1.bu.edu`
+ Pedir session interactiva : `qlogin -l gpus=1`
+ Usar el nuevo compilador PGI: `module switch pgi/13.5 pgi/16.5`
+ Obtener información de GPU: ` pgaccelinfo `  y  `nvidia-smi`


Compilar: ` pgf90 -acc -Minfo=accel hola.f90 `

Correr: `./a.out`

### Dependencia de datos:

+ Los loops NO se paralelizan si hay dependencia de datos.


### Iniciar región paralela:

Ejemplo: *SAXPY* (Single-precission A X Plus Y)
```fortran
!$acc parallel loop
  do i=1,n
    y(i)= a*x(i)+y(i)
  end do
!$acc end parallel loop
```

