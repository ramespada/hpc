---
layout: lecture
date: 2023-01-06
title: Debug & Profiling
description: Herramientas para debbug y profile
ready: true
---

# GDB (GNU Debugger) 

> `gdb` o *GNU Debugger* es el depurador estándar para el compilador GNU. Es un depurador portable que se puede utilizar en varias plataformas Unix y funciona para varios lenguajes de programación como C, C++ y Fortran. GDB fue escrito por Richard Stallman en 1986. GDB es software libre distribuido bajo la licencia GPL. 


Para poder usar `gdb` es necesario compilar nuestro programa con la flag `-g`, por ejemplo:

```shell
 $> gfortran -g mi_programa.f90
```
ó para el caso de C:
```shell
 $> gcc -g mi_programa.c
```

esta flag preserva identificadores y simbolos que usualmente se pierden al compilar el programa.

Para ejecutar `gdb` pasamos como arbumento el ejecutable:

```shell
$> gdb a.out
```

en caso que el programa tenga argumentos usamos la opción `--argos`:
```shell
$> gdb --args a.out arg1 arg2
```
 también es posible pasar los argumentos una vez iniciado gdb con el comando: `set args arg1 arg2`.

Una vez dentro de `gdb` vemos una linea de comando "interactiva", lo primero que hacemos es ejecutar el comando `run` para ejecutar el programa y parar donde encuentre un *segmentation fault*.

4.  Once GDB has started, you'll be in an interactive "shell" in which
    you can give GDB (and your program) commands. Start by having GDB
    run your program by typing:

    `run`

    which will run your program and *pause* its execution when it gets
    to the segmentation fault.

5.  GDB will display the line of code at which the error occurred.
    However, it will be more helpful to see the entire source file. To
    do this use the Text User Interface (TUI) mode by typing:

    `layout next`

    Using the up and down arrows, you can scroll through the source
    file. Occasionally, the display may glitch. Don't panic, simply
    type:

    `refresh`

    and the screen will refresh itself. As a short-cut you can use
    control-L to refresh.

6.  Examine some of the variable values to investigation what the issue
    is. To print a variable value, use:

    `print i`

    `print n`

    To print the contents of an array, you need to dereference it and
    provide GDB with its length. Example:

    `print *a@5`

    In this particular case GDB will be unable to print the contents of
    the array. Obviously something went wrong before the program got to
    this point.

7.  To find out what went wrong with the array, we need to rerun the
    program and examine its execution *before* we got to the
    segmentation fault. To do this, set a *breakpoint* in the program. A
    breakpoint is a line or point in a program where the debugger will
    pause execution from which you can continue execution in a
    step-by-step manner. Set a breakpoint at the `randomArray`
    function where the array was created:

    `break randomArray`

    Restart the program by typing `run` and confirming.

8.  GDB will pause execution at the beginning of the `randomArray`
    function. You can now step through the program line by line by
    typing `next` or just simply `n`. Note that if you
    want to resume execution, you can use the `continue` command.

    1.  Step through an iteration of the for loop and print the array:
        `print *a@5`

    2.  Step through the second iteration and print it again:
        `print *a@5`

    3.  This can get tedious, so you can set a watchpoint that will
        print a variable any time it changes. Set a watch point for the
        array: `watch *a@5`

    4.  Step through the rest of the iterations and watch the array get
        filled with random values.

    5.  Step through the return of the function; when it gets back to
        the `main` function, print the contents of the array again:
        `print *arr@5` and you'll see that you cannot access the
        memory there.

9.  Quit out of GDB using `quit` and edit the code to fix this
    bug (hint: what did the `randomArray` return?) and recompile.

### Bug, The Sequel

1.  Run the program again from the command line to see if it works. It
    should run but it probably won't give correct results (on some runs
    it may, but on most it will not). Start GDB again but this time use
    the following to immediately start it in TUI

    `gdb -tui --args a.out 5`

2.  The problem probably lies with how we're computing the average, so
    set a breakpoint either at the start of the `average` function:

    `break average`

    or at a particular line within that function, example:

    `break 57`

3.  Set another break point at the end of the function:

    `break 62`

    Note that you can set a breakpoint at a particular line in any file
    using the syntax:

    `break fileName.c:42`

4.  Now, you can either step through the execution of the loop and/or
    set a watchpoint on the `sum` variable or you can skip ahead to
    the end of the loop by using `continue` which will resume
    execution until the next breakpoint.

5.  Print the `sum` variable's value to see if it matches the value
    you expect. Or:

    -   You can print all local variables using

        `info locals`

    -   You can print all the parameter values using

        `info args`

    -   You can print the value of expressions as well, example:

        `print sum / n`

    -   Since return values are not stored in variables, another thing
        you can do is to use

        `finish`

        which will continue execution until the function returns and
        then prints the returned value.

6.  Fix the bug(s) that you were able to identify and recompile/rerun
    the program until you are certain that all bugs have been addressed.

## The Main Show

Now that you have some familiarity with GDB, you'll use your new
debugging skills to debug a full program. We have provided source files
and a `makefile` that builds a tic-tac-toe game project. The game allows a
player to select several different modes including a 2-player game, a
1-player versus the computer (which makes random moves) and a 1-player
versus a "smart-ish" computer (it can still be beaten).

Similar to the previous part, we have introduced several bugs (5 to be
exact). Run the program and use GDB to walk through section(s) of the
code you believe to contain bugs and fix them all until the program runs
without any problems.

Some tips/hints:

-   Write down the sequence of inputs/moves that led to a crash/bug so
    that you can *reproduce* the sequence when debugging and so that you
    can retest the sequence when you think you've fixed the bug.

-   When you observe a bug, describe exactly how it manifests, this will
    help you form a *hypothesis*

-   Set breakpoints and watchpoints so that you can trace through the
    program to points where you believe bugs might be located.

-   Try to fix only one problem at a time and keep track of your fixes.
    In a real project you would do so through a bug tracking system and
    commit messages, but for this hack you may do so through comments.

-   Keep in mind that bugs may manifest themselves later in the program
    when the problem lies earlier in the program.

-   You can get a bigger picture in GDB by printing out a full stack
    trace using

    `backtrace full`

Only hand in the 3 source files that were debugged
(`game_utils.c`, `player_utils.c`, `ticTacToe.c`); header files, the
`makefile` and other source files will be provided by the grader.








# `gprof`

> `gprof` es una herramienta de análisis de rendimiento para aplicaciones Unix. Usó un híbrido de instrumentación y muestreo y fue creado como una versión extendida de la herramienta "prof" más antigua. A diferencia de prof, gprof es capaz de recopilar e imprimir gráficos de llamadas limitados.
