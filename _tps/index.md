---
layout: lecture
title: "TPs"
---

En esta sección se presentan algunos problemas prácticos para implementar y 
analizar su performance, escalabilidad y entender algunos fenómenos de la computación
paralela.

## Hola mundo

El primer paso con cualquier nueva herramienta es asegurarnos que funciona en nuestra computadora.
Para esto siempre es muy útil escribir un programa *"hola mundo!"* que encapsule lo más básico de la 
nueva herramienta a usar.

[c](hola/hola.c)         |
[fortran](hola/hola.f90) |
[omp](hola/hola_omp.f90) |
[mpi](hola/hola_mpi.f90) |
[cuda](hola/hola_cuda.c)



## Integral PI

Un buen primer ejemplo para practicar como paralelizar código es
la integración numérica. En este caso se eligió la integral de la función
<center>
f(x)=4/(1+x^2)
</center>
la razón de elección de esta función es que su integral entre 0 y 1 es numéricamente
igual a &pi; y por lo tanto es fácil de corroborar su correcta implementación.


## SAXPY

SAXPY es el acrónimo de *Single precisión A times X plus Y* y es una operación 
ampliamente utilizada como benchmark para comparar performance entre distintas 
herramientas ya que es una operación que aparece a menudo en problemas de algebra
lineal y el cálculo numérico. Y consiste tan solo en ejecutar la siguiente operación:
<center>
<b>Y</b> = a &times; <b>X</b> + <b>Y</b>
</center>

donde *a* es un escalar, *X* e *Y* son vectores de longitud "n".


## Jacobi

Es un método para resolver sistemas de ecuaciones lineales (SELs) que que a diferencia de
Gauss-Seidel tiene mayor potencial para paralelizar.


## Transformada de Fourier


## Transporte de Calor


## Mecánica de fluidos


## Procesamiento de señales


## Fibonacci


## Machine learning


{% comment %}
## Remote machines

How to stay sane when working with remote machines using SSH keys and
terminal multiplexing. No more keeping many terminals open just to
run two commands at once. No more typing your password every time you
connect. No more losing everything just because your Internet
disconnected or you had to reboot your laptop.

In the example below we use `tmux` to keep sessions alive in remote servers and `mosh` to support network roaming and disconnection.

<video autoplay="autoplay" loop="loop" controls muted playsinline  oncontextmenu="return false;"  preload="auto"  class="demo">
  <source src="/static/media/demos/ssh.mp4" type="video/mp4">
</video>

## Finding files

How to quickly find files that you are looking for. No
more clicking through files in your project until you find the one
that has the code you want.

In the example below we quickly look for files with `fd` and for code snippets with `rg`. We also quickly `cd` and `vim` recent/frequent files/folder using `fasd`.

<video autoplay="autoplay" loop="loop" controls muted playsinline  oncontextmenu="return false;"  preload="auto"  class="demo">
  <source src="/static/media/demos/find.mp4" type="video/mp4">
</video>

## Data wrangling

How to quickly and easily modify, view, parse, plot, and compute over
data and files directly from the command-line. No more copy pasting
from log files. No more manually computing statistics over data. No
more spreadsheet plotting.

## Virtual machines

How to use virtual machines to try out new operating systems, isolate
unrelated projects, and keep your main machine clean and tidy. No
more accidentally corrupting your computer while doing a security
lab. No more millions of randomly installed packages with differing
versions.

## Security

How to be on the Internet without immediately revealing all of your
secrets to the world. No more coming up with passwords that match the
insane criteria yourself. No more unsecured, open WiFi networks. No
more unencrypted messaging.

# Conclusion

This, and more, will be covered across the 12 class lectures, each including an
exercise for you to get more familiar with the tools on your own. If you can't
wait for January, you can also take a look at the lectures from [Hacker
Tools](https://hacker-tools.github.io/lectures/), which we ran during IAP last
year. It is the precursor to this class, and covers many of the same topics.

We hope to see you in January, whether virtually or in person!

Happy hacking,<br>
Anish, Jose, and Jon

{%endcomment%}
