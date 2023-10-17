--- 
layout: lecture
date: 2023-01-03
title: Fortran 
descripcion: Tutorial de Fortran
ready: true
---

# Fortran

> Fortran es un lenguaje de programación de alto nivel de propósito general, procedimental e imperativo, que está especialmente adaptado al cálculo numérico y a la computación científica.



## Hola mundo!
Para escribir un programa en fortran es necesario abrir con un editor de textos un archivo en blanco, y guardarlo con extensión ``.f90`` y adentro de este escribir el código, por ejemplo:

```fortran
program nombre_del_programa

	print*, "Hola mundo!"

end program
```


## Compilación y ejecución:
Si el programa anterior lo hubieramos guardado en el archivo ``00holamundo.f90``, entonces para compilarlo (usando `gfortran`) abrimos una terminal (``ctrl``+``T``, en linux), vamos al directorio donde guardamos el archivo de texto y escribir en la terminal:

```bash
$> gfortran 00holamundo.f90
```

se va a crear un archivo ejecutable con nombre ``a.out``, este se puede ejecutar escribiendo:

```bash
$> ./a.out
```

Si quisieramos que nuestro programa tenga otro nombre al compilar debemos escribir: `` gfortran 00holamundo.f90 -o mi_programa.exe ``.


## Estructura de un programa en fortran

Ya vimos todos los programas comienzan en `program nombre_del_programa`, y finalizan en `end program`, dentro de estas dos instrucciones vamos a escribir las intrucciones del programa.

### Comentarios
Los *comentarios* son partes del código que **no** se ejecutan, sirven simplemente para dejar mensajes a quienes lean el código en el futuro, y facilitar la comprensión del mismo. En FORTRAN los comentarios se realizan con el símbolo de exclamación (**!**), por ejemplo:

```fortran
        !Esto es un comentario
```

### Variables y declaración de variables
 Las *variables* son los objetos en los que guardamos información (números, palabras, etc.). El primer paso en todo programa es definir cuáles son las variables (como se llaman) que serán utilizadas por el programa y cual es su *tipo* .

#### *implicit none*
 Antes de declarar las variables vamos a colocar la sentencia **`implicit none`**. Esto lo que hace es obligarnos a definir explicitamente todas las variables que serán utiliadas por el programa (caso contrario fortran las define por nosotros en base al nombre que les pongamos, utilizando un criterio qua es confuso y por lo tanto nadie usa).

  En la declaración de una variable, primero especificamos de qué *tipo* de variable se trata (más adelante veremos que tipos existen), y su nombre, separados por **::**. Por ejemplo:
```fortran
          implicit none
          integer :: n    !defino un entero llamado "n"
          real    :: x,y  !defino dos reales llamados "x" e "y"
```

se pueden declarar multiples variables en una linea (separandolas por *','*) y los nombres pueden ser letras ó palabras (recuerden que fortran no distingue entre mayúscula y minúscula!)

### Iniciar variables
A las variables podemos asignarles valores, esto se realiza con el signo **`=`**. Por ejemplo podemos asignarle a **n** un valor entero (`n=3`). Esta asignación se puede realizar cuando se definen las variables, ó luego, en el cuerpo del programa.

### Cuerpo del programa
Luego de definir las variables podemos realizar acciones con ellas. Por ejemplo, hagamos un programa que pida el nombre del usuario, lo guarde en una variable y luego lo muestre en pantalla, se escribiria:

```fortran
      program nombre_del_programa

        !Definición de variables:
          implicit none
          character(len=10) :: nombre

        !Cuerpo del progrma:
          print*,"Cuál es tu nombre?"
          read*, nombre     ! READ guarda lo que escribas adentro de la variable nombre  
          print*,"Hola ", nombre,", todo tranqui?"

      end program
```               
## *Data types*

Cualquier variable que se defina en fortran va a pertenecer a uno de estos 5 tipos:

  1. ``LOGICAL``
  2. ``INTEGER``
  3. ``REAL``
  4. ``COMPLEX``
  5. ``CHARACTER``

Cada uno de ellos tiene sus propias características y operaciones.

### `LOGICAL`
También conocidos como *booleanos*, sólo pueden tomar dos valores: **.true.**  ó **.false.**. Para declararlas escribimos: `logical :: mi_variable_logica` .

#### Operaciones lógicas
Estas operaciones toman 1 ó 2 variables lógicas y retornan otra variable lógica. Por ejemplo, sean `p` y `q` dos variables logicas:

|Sintaxis    | Operación         | Descripcion                                      |
|:----------:|:----------------- |:------------------------------------------------ |
|`.not. p`   | *Negación*        |Retorna el opuesto.                               |
|`p .and. q` | *Conjunción*      |Retorna **.true.**  sii ambas son **.true.**.     |
|`p .or. q`  | *Disyunción*      |Retorna **.false.** sii ambas son **.false.**.    |
|`p .eqv. q` | *Equivalencia*    |Retorna **.true.**  sii ambas son iguales.        |
|`p .neqv. q`| *In-equivalencia* *(XOR)* |Retorna **.false.** sii ambas son iguales.|


### `INTEGER`
Representan los números enteros. Se declaran: ` integer ::  mi_entero, otro_entero=2`
#### Operaciones:
- **Aritméticas:**
    - Suma (+) y Resta (-)
    - Multiplicación (\*) y División (/)
    - Potencia (\*\*)

*(Advertencia: Los enteros no son cerrados en la division! Por lo tanto esta division retorna el cociente entero.)*

- **Relacionales:**
Toman dos *INTEGER* y devuelven un *LOGICAL*, sirven para comparar INTEGER entre sí, por ejemplo sean `n` y `m` dos enteros:

| Sintaxis    | Operación       | Descripcion                                        |
| ----------- |:---------------:|:-------------------------------------------------- |
| `n ==  m`   | *Igualdad*      | Devuelve  **.true.**  sii n es igual a m.          |
| `n /=  m`   | *DesIgualdad*   | Devuelve  **.false.** sii n es igual a m.       |
| `n  <  m`   | *Menor*         | Devuelve  **.true.**  sii n es menor a m.          |
| `n <=  m`   | *Menor-igualdad*| Devuelve  **.true.**  sii n es menor o igual a m. |
| `n  >  m`   | *Mayor*         | Devuelve  **.true.**  sii n es mayor a m.         |
| `n >=  m`   | *Mayor-igual*   | Devuelve  **.true.**  sii n es mayor o igual a m. |

 *(Advertencia: No confundir `==` con la asignación `=`)*

- **Intrinsecas:**
Las operaciones *intrinsecas* son funciones que vienen pre-definidas en fortran. Las más importantes para `INTEGER` son:
```fortran
    abs(n)    ! valor absoluto de n
    mod(n,m)  ! resto de dividir n por m
```

### `REAL`
Los REAL (también conocidos como *punto flotante*) son los tpos de datos que usamos para representar numeros reales. 

*Advertencia: Los numeros reales tienen infinitos decimales pero las computadoras solo pueden almacenar en memoria números de finitios decimales, por lo que en algún punto tiene que redondearlos. Este proceso acarrea errores (conocidos como errores de redondeos).*
 
Para declarar un real escribimos:  `real  :: mi_numero_real`. Si queremos que tenga mas decimales podemos declararlo como `double precision  :: mi_var_doble_precisionx`.

#### Operaciones:
- **Artiméticas**  (+, - , \* , /, \*\* )
    - Tener en cuenta la **precedencia** (jerarquias): la suma y la resta tienen mayor jerarquía que la multiplicación y la división, y estos a su vez mayor jeraquía que la potencia. Ante la duda lo mejor es utilizar todos los **parentesis** que sean necesarios.
  
- **Intrinsecas**
Hay muchas funciones en fortran definidas para reales, algunas de las más utilizadas son:
```fortran 
sqrt(x); log(x); log10(x); exp(x); sin(x); cos(x) ...
```
	*(Observación: utilizando `;` podemos ejecutar multiples instrucciones en una sóla linea.)*

### `COMPLEX`
Estos representan los números complejos (números con parte *real* y parte *imaginaria*). Se almacenan como un par ordenado  *(Re, Im)*, y se declaran:
` complex :: z=(1,2) `

#### Operaciones

- **Aritmeticas**  (+ - \* / \*\*)

- **Intrinsecas**
Algunas funciones intrínsecas básicas de complejos son:
 ```fortran
      real(z)           !devuelve parte real
      aimag(z)          !devuelve parte imaginaria
      conjg(z)          !devuelve el conjugado de z
      abs(z)            !devuelve el módulo de z
      atan2(real(z), aimag(z)) !devuelve el argumento de z
```

### `CHARACTER`
Tambien conocidos como `strings`, se utilizan para almacenar letras y palabras. Se declaran: `character :: letra` ó `character(len=10) :: palabra`. Donde `len=n` define el numero de caracteres que tiene la variable.

#### Operaciones:
```fortran
len(palabra)                	!devuelve el numero de caractéres
palabra(3:7) 		    	!substring (de la letra 3 a la 7)
palabra(3:)//palabra(1:3)   	!concatenación
trim(palabra)		    	!remueve espacios blancos al final del string
repeat(palabra,n)           	!concatena (repite) el string n-veces
index(palabra, patron)      !devuelve la posición en la que aparece 'x' por primera vez
scan(palabra,set)   !devuelve la pos. en la que aparece alguna de las letras 'set' por primera vez.
verify(palabra,set) !devuelve la pos. en donde 'palabra' deja de ser igual a 'set'
```

Operaciones tales como `upper`, `lower`, `replace` o `split` no estan presentes en fortran como operaciones base, pero obviamente pueden ser programadas sin mucha dificultad.


## Controladores de flujo

> Sintaxis de los controladores más importantes en fortran (*loops* y *condicionales*). 

La funcion de los *controladores* es alterar la secuencia de instrucciones a ser ejecutadas.

### Condicionales
Los condicionales ejecutan un segmento de código cuando se cumple alguna condición.

#### `IF`
  El **`if`** revisa si se cumple una condición (generalmente expresada en una operación relacional), en caso afirmativo ejecuta una porción de código, y en caso negativo sigue de largo hasta encontrarse con otro condicional, su sintaxis en fortran es así:
```fortran
    if(x > 0) then
        print*,"x es positivo."
    else if (x < 0) then
        print*,"x es negativo."
    else
        print*,"x es cero."
    end if
```

#### `CASE`
 El controlador **`case`** propone una serie de escenarios para el valor de una variable, y de acuerdo a cual se cumpla ejecuta un procedimiento distinto. Por ejemplo:

```fortran
  select case (x)
    case(1:)
      print*,"x es positivo."
    case (:-1)
      print*,"x es negativo."
    case default
      print*,"x es cero."
  end select
``` 

### Loops
  Los loops (o *bucles*) ejecutan una secuencia de código repetitivamente (*iterativamente* decimos) un número determinado de veces (ó hasta/mientras que se satisfaga una condición).

#### `DO`

El principal *loop* es el **`do`** (equivalente al **`for`** de otros lenguajes)

Este controlador utiliza un `INTEGER` como *contador* (ó indice), el cual va tomando distintos valores, y las instrucciones contenidas en el bloque `do` se repiten para cada valor del contador. La sitaxis en fortran es:
```fortran
    do i=1,10,2    	!i toma valores del 1 al 10, y avanza de a 2     
        print*,i   
    end do
```
El programa anterior mostrará secuencialmente en pantalla los numeros del 1 al 10. 

#### `DO WHILE`
Este controlador es una mezcla de los dos anteriores, funciona repitiendo una serie de instrucciones, pero chequiando en cada repetición si una condición se cumple, en caso que deje de cumplirse termina de *iterar*. Su sintaxis es:
```fortran
    do while (i<10)  !ejecutar mientras i sea menor a 10
        print*,i
        i=i+2
    end do
```
Este código hace exactamente lo mismo que el `do` anterior.

---
  Algunos comandos útiles para utilizar dentro de controladores son:
- **`STOP`** termina la ejecución del programa.
- **`EXIT`** sale del bloque controlador.
- **`CONTINUE`** no hace absolutamente nada (pero aveces queda prolijo).
- **`CYCLE`** pasa a la siguiente iteración (en loops).


## Procedimientos

> Crear *funciones* y *subrutinas*.

  Los procedimientos (**funciones** y **subrutinas**) sirven para *encapsular* un conjunto de instrucciones que cumplen alguna función ó que se utilizan reiteradas veces a lo largo del código.
  Construir procedimientos nos va a ahorrar muchas lineas de código y va a hacer nuestro programa mucho más entendible. 
 Los procedimientos se colocan al final del cuerpo del programa, y van precedidos de la sentencia: **`contains`**.

## `FUNCTION`
Las funciones toman una serie de argumentos (valores de entrada o *inputs*), hacen algun procedimiento con ellos y retornan un único resultado (valor de salida o *output*).

Por ejemplo, una funcion que suma dos reales se escribe:
```fortran
        function suma(x,y)   result(z)
          implicit none
          real, intent(in) :: x,y
          real :: z
    
          z= x+y
         end function suma
```
  Las variables definidas adentro de la función no tienen por que existir afuera de esta, por esto se las conoce como **dummy arguments** y simplemente linkean las variables externas (que entran como argumentos a la funcion y sí están definidas en el programa) con las variables internas del procedimiento.

  Es recomendable definir la variable de salida (**`result`**), dentro de la funcion, si no se define explicitamente va a tomar el nombre de la funcion.

  Con **`intent`** decidimos si queremos que la variable externa sea modificada ó no, a lo largo del procedimiento.
  - *`intent(in)`*  significa que la variable se define como *solo lectura*
  - *`intent(inout)`* lectura y escritura (*default*).
  - *`intent(out)`*  la variable queda como sólo escritura (no se para que sirve).

Una vez definida una función se la invoca en el programa como: `mi_funcion(arg1,arg2)`

### `SUBROUTINE`
  Las subrutinas a diferencia de las funciones no retornan ningún resultado, aunque sí pueden modificar variables preexistenes del programa (mediante `intent(inout)`).

  La sintaxis de una subrutina es:
```fortran
      subroutine suma(arg1,arg2,arg3)
        implicit none
	
	real, intent(in)    :: arg1,arg2
	real, intent(inout) :: arg3

	arg3= arg1 + arg2

      end subroutine

```

La subrutinas se invocan escribiendo: ` call mi_subrutina(arg1,arg2,...) `


## Modulos

> Crear modulos internos y externos. Uso de interfaces.

  Los módulos son bloques de código que guardan informacion, subrutinas y funciones. Van a hacer que nuestro programa sea más entendible y manejable. Sobre todo cuando hagamos un proyecto grande.

### Módulos internos:

Un módulo interno se escribe en el mismo archivo que el programa principal y antes que este. Funciona y tiene la misma estructura que un programa normal, la sintaxis sería:

```fortran
   module mi_modulo
     implicit none
     !Declaración de parametros

      contains
      !Definición de Subrutinas y Funciones
    
   end module

   program main 
	use mi_modulo

	... 		!aca va el programa principal

   end program main
```

Para utilizar el modulo en el programa principal lo llamamos con: **`use mi_modulo`** ó si sólo queremos usar algunas subrutinas contenidas en el mismo lo llamamos: **`use modulo, only : rutina1,rutina8`**

### Módulos externos:

Un módulo externo va a ser exactamente lo mismo pero copiado en un archivo aparte, la única diferencia va a estar en su compilación:

```
  gfortran -c modulo.f main.f
  gfortran modulo.o main.o
```
En la compilacion siempre el orden de los archivos va a de menor a mayor jerarquia, el ultimo archivo es el programa principal.

Cuando el programa se vuelva complejo y tenga muchos modulos llamandose entre si vamos a tener que usar para compilar _**Makefiles**_ .


### Variables públicas y privadas
Podemos decidir si las variables generadas en los módulos van a estar disponibles, ó no, fuera de este.

Eso se realiza poniendo antes de la declaración de cada variable la sentencia **`public`** ó  **`private`** según corresponda.


### Interfaces:

Las interfaces tienen varios usos, pero uno de ellos es generalizar procedimientos dandole flexibilidad a las variables de entrada y/o salida de una funcion.

Por ejemplo, si queremos definir una funcion que calcule el cuadrado de un numero, pero el numero de entrada puede ser tanto `real` como `complex`. Luego tenemos que definir una funcion para cada caso, aunque mediante la interfaz podemos unificarla en una sola funcion mas grande:

```fortran
    interface RaizCuadrada
        procedure  RaizCuadradaR, RaizCuadradaC
    end interface RaizCuadrada

    contains

    function RaizCuadradaR(x)	result(x_cuadrado)
		real :: x, x_cuadrado
    		x_cuadrado=x*x
    end function RaizCuadradaR

    function RaizCuadradaC(z)	result(z_cuadrado)
		complex :: z, z_cuadrado
    		z_cuadrado=z*z
    end function RaizCuadradaC
```
Cuando usemos `RaizCuadrada(x)` nos va a devolver el resultado de aquella funcion que sea compatible con `x`. Este proceso de asociar el nombre de una funcion con varias funciones se lo conoce como **overloading**.




## Input/Output

> Leer y escribir información..

### Standard I/O
  Los standard input/output (abreviados: *stdin*/*stdout*), son las formas más símples de transferencia de información entre la computadora y el usuario.

  El *stdin* es el que está vinculado a las entradas que damos desde la consola con nuestro teclado. En FORTRAN el ingreso de *stdinput* se reclama con la función **`read`**:
 ```fortran
    read(*,*),variable
```

La forma mas simple de retornar informacion es el *stout*, que serian los mensajes que aparecen en consola. Para mandar cosas al *stout* podemos usar:
```fortran
    write(*,*),'mensaje' 
    print*,'mensaje' 	!esta es la forma abreviada
```
Comentario: Una forma de pensar al stdout es como un archivo almacenado en algun lugar de la computadora (en linux generalmente esta en */dev/fd/2*). Cada vez que un cambio se produce en este archivo la terminal lo muestra en pantalla.

De los dos asteriscos que aparecen en `read(*,*)` y `write(*,*)`, el primero está vinculado al **numero de unidad logica** (*logical unit number*) `UNIT`, y el segundo con el formáto del input/output (`FMT`).

### Unidad Lógica
La unidad lógica está vinculado al *canal* por el que viajan los inputs y ouputs. A medida que el preograma se ejecuta la información puede moverse en múltiples rutas (por ejemplo ir a distintos archivos) para distinguirlas es conveniente *etquietar* las unidades lógicas, en FORTRAN usamos un `INTEGER` para tal fin. Si la unidad logica es el *stdin/stdout* entonces `UNIT=*`. Cuando veamos como trabajar con archivos vamos a profundizar en esto.

### Formato
El formato `FMT` es un `CHARACTER` en el cual se especifica la forma del output ó input (siempre que sepamos, caso contario `FMT=*`).

Las códigos utilizados para definir el formáto de las variables de fortran son:

|**FMT** |    tipo     | descripcion   		                |
| ------ |:-----------:| --------------------------------------:|
| Fn.m   | `REAL`      | punto flotante en forma decimal. 	|
| En.m   | `REAL`      | punto flotante en forma exponencial.   |
| Dn.m   | `DOUBLE PRECISION`      | punto flotante de doble precision.   |
| In     | `INTEGER`   | numero entero		       		|
| An     | `CHARACTER` | caracter alfanumerico	        	|
| Ln     | `LOGICAL`   | variable logica	        	|

donde : **`n`** = numero de espacios/digitos totales de la variable (considerar que el signo la coma y el signo de exponente ocupan un espacio); **`m`**= decimales (mantisa para la forma exponencial).

#### Otros símbolos que podemos usar en FMT:

Los simbolos que describen como es el formato se denominan especificadores de formato (*format specifiers*), algunos bastante utiles:

|**FMT** | descripcion         		                      |
| ------ | --------------------------------------------:|
| n(...) | Repetir lo que esta entre (...) n-veces	    |
| "..."  | Literal (lo que esta dentro de "")    	      |
| nX  	 | Espacio horizontal/skip        	  	        |
| /      | Espacio vertical/nueva linea	       		      |
| SP	   | Mostrar signo 		 		                        |


## Manejo de archivos
Otra forma de transferir informacion es mediante el uso de archivos.

### **`OPEN`**/**`CLOSE`**
Si queremos abrir un archivo en FORTRAN, tenemos que usar el siguiente comando:

```fortran
    open(UNIT=1, FILE='archivo.txt') 	!abrir archivo			   
    
	!(aca hariamos algo con el archivo...	)

    close(UNIT=1)			!cerrar archivo
```
Los unicos argumentos obligatorios son `UNIT` y `FILE`. Pero hay otros argumentos opcionales que pueden ser utiles:

| Keyword   |  Valor/Tipo   |    Comentarios                 |
|:--------- |:--------------|:-------------------------------|
| `UNIT`    | (`INTEGER`)   | Número de unidad lógica (LUN)  |
| `FILE`    | (`CHARACTER`) | Nombre de archivo a usar       |
| `STATUS`  | 'OLD'         | Para archivo preexistente      |
|           | 'NEW'         | Para nuevo archivo             |  
| `ACCESS`  | 'SEQUENTIAL'  | Lectura linea por linea        |
|           | 'DIRECT'      | Lectura de acceso 'random'     |
| `FORM`    | 'FORMATTED'   | Para archivo alfanumérico      |
|           | 'UNFORMATTED' | Para archivos binarios         |
| `ACTION`  | 'READ'        | Solo lectura                   |
| 	        | 'WRITE'       | Solo escritura                 |
| 	        | 'READWRITE'   | Lectura y escritura            |
| 	        | 'UNDEFINED'   | Indefinido                     |
| `IOSTAT`  | (`INTEGER`)   | Guarda el estado del proceso   |


Recuerden que `UNIT` es la unidad logica, es un numero entero que nos va a servir para referenciar el archivo siempre que invoquemos alguna funcion que necesite hacer eso del archivo. 

Un argumento muy util es `IOSTAT`, esta es una variable `INTEGER` (que debemos crear previamente) y sirve para saber si fue exitosa la lectura. En base a este podemos planificar un mensaje de error y asi poder ubicar el lugar donde se produjo el error en el codigo. `IOSTAT` se inicializa en 0, cuando termina la lectura cambia a:                                                          
	- (-1), cuando termina de leer el registro.
	- (-2), si la lectura se estanca.
	- numero positivo, si hay un error fatal.


### **`READ`**/**`WRITE`**

Una vez que tenemos un archivo abierto podemos leer o escribir informacion en el utilizando los mismos comandos que antes, esta vez especificando la `UNIT` correspondiente al archivo en cuestion, si queremos escribir algo:

```fortran
	OPEN(UNIT=1, FILE="archivo.txt",STATUS="NEW",ACTION="WRITE")
        WRITE(UNIT=1, FMT='(a30)') 'aca dejo un mensaje'
	CLOSE(UNIT=1)
```
y para leer contenido de un archivo:
```fortran
	OPEN(UNIT=1, FILE="archivo.txt",STATUS"OLD",ACTION="READ")
        READ(UNIT=1,FMT='(a30)') mensaje_leido
	CLOSE(UNIT=1)
```

### **`NAMELIST`**
Los namelist son una forma muy comoda de inicializar un conjunto de variables desde un archivo externo.

Dentro de un namelist es un archivo externo que contiene el nombre de un grupo de variables y sus valores, por ejemplo asi:
```
&mi_namelist
	var1= 1,
	var3='hola', v4=6.54	!no importan los espacios
	var2= 2.12321, 		!no hace falta que esten ordenados
	...
	varN=.true.,
/
```
*mi_namelist* es un identificador del namelist, ya que puedo tener varios, incluso en el mismo archivo. Se utilizan los simbolos **&** y **/** para delimitar cada namelist.

Dentro del codigo tenemos que definir el nombre del namelist (en este caso *mi_namelist*), y todas las variables contenidas en el. La sintaxis seria:
```fortran
	namelist/mi_lista/var1,var2,var3,...,varN   	!defino namelist
```

Finalmente para leer el namelist usamos la funcion open/close y read de la siguiente forma:
```fortran
	open(7,file='mi_namelist.inp')			!abro namelist
    	read(7,mi_lista)				!leo los valores
	close(7)					!cierro namelist
```

Advertencia: como siempre todas las variables dentro del namelist deben ser definidas antes de definir el namelist y de ser leidas.


## Arrays

> Declarar, y trabajar con arrays.

Los arrays son una forma de almacenar multiples valores en una sola variable.  

### Declaración
La declaración de arrays, es igual a la de cualquier variable, sólo es necesario añadir el rango (ó dimensión) y el número de elementos por cada dimensión.

```fortran
   implicit none
   character(len=20), dimension(5) :: lista
   integer, dimension(6) :: n 		!Vector entero
   real  	  :: v(6)	     !Vector 
   real 	  :: A(3,3)    !Matriz 3x3

```
Por default cada dimension se indexa empezando desde 1, pero eso puede ser modificado al definir el array, por ejemplo: `integer :: n(8:12), m(-5:2), o(0:3)`. 

## Iniciación
La iniciacion de arrays puede ser un poco mas tediosa, muchas veces involucran loops, pero existen algunos atajos para simplificar la notacion, ademas muchas veces los arrays los vamos a levantar desde algun archivo o  utilizando alguna libreria especifica, asi que no es tan grave ni tan importante.

Hay muchas formas de iniciar un array, algunas de las más comúnes:
```fortran
  lista(1) = 'Manzana'		!Directo
  lista(2) = 'Banana'
  lista(4) = 'Kiwi'

  n=(/ 4, 3, 8, 7,-1, 0 /)	!Directo en una linea

  do i=0,10,2			!Loop
	n(i)=i
  end do

  n=(/ (i,i=0,10,2) /)		!Loop implicito
  
  v=(/ (i,i=1, 6,1)  /)*0.45
  v=(/ (i*0.45,i=1, 6,1)  /)

  A= 0.				!Todos los elementos igual a zero

  A(1,:)=(/ 1.0, 0.0, 0.0 /)	!Por filas/columnas
  A(2,:)=(/ 0.0, 1.0, 0.0 /)
  A(3,:)=(/ 0.0, 0.0, 1.0 /)

  A = reshape((/(i*0.25,i=1,size(A))/),shape(A)) !usando reshape
```

Algunas operaciones que nos dan información sobre los arrays son:
  - `size()` devuelve el *numero de elementos total*
  - `shape()` devuelve un array con el numero de elementos por dimension
  - `lbound()` `ubound()`, devuelve el min/max indice de cada dimension (recuerden: no siempre empiezan en 1) 

### Acceso y asignación
Se puede acceder a los elementos de los arrays de la siguiente forma:

```fortran
    A(3,1)	    !Acceso elemento [fila:3, columna:1]
    A(:,1)	    !Acceso columna 1
    A(2,2:3)	  !Acceso fila 2, columnas del 2 a 3
    A(1:6:2,:)  !Acceso a filas del 1 al 6, cada 2 filas
	
    A(3,1)=5.1	!asignar valores a un elemento
    A(3:5,1)=(/ 1.4, 2.0, 8.7 /)	!asignar valores a un conjunto de elementos
```

### Algunas operaciones

Algunas operaciones basicas que pueden realizarse con arrays:
```fortran
    !Aritmética
    A+A*2    	 !operan elemento por elemento

    sum(A)    	!suma todos los elementos de A
    product(A) 	!producto de todos los elementos de A

    all(A>0)     !Todos los elementos de  A > 0?    (.true./.false.)
    any(A<0)     !Algún elemento de A es < 0 ? 	    (.true./.false.) 
    count(A>0.2) !Cuantos elementos cumplen A>0.2 ? 
```

## Memoria y portabilidad

> Uso uso de memoria.

### Variables estáticas: Tamaño y forma fija. 

Hasta ahora siempre trabajamos con variables de tamaño fijo, pero si queremos trabajar con variables cuyo tamaño cambie a lo largo de la ejecucion del programa vamos a necesitar definir *variables dinámicas*.

### Variables dinámicas
Cualquier variable que definimos ocupa un espacio en la memoria el cual se le es asignado mediante un identificador (**adress**). Las variables dinámicas son variables cuyo adress se determina cuando el programa esta corriendo.

#### Declaración:
En fortran, para definir una variable dinamica escribimos:

```fortran
    real, allocatable   ::  var(:)
```
Notar que agregamos la sentencia **`allocatable`**, y además reemplazamos el número de elementos de cada dimensión por el simbolo **`:`**, esto deja el tamaño de la variable indefinido. Sin embargo, cuando quiera hacer uso de la variable voy a tener que especificar su tamaño, esto se hace:

```fortran
   ALLOCATE(name(bounds) ) ! Asignar memoria
```
donde *bounds* es `shape` deseado para la variable.

Cuando querramos liberar memoria podemos *desalocatar* a la variable, así:

```fortran
   DEALLOCATE(name)        ! Liberar memoria
```

#### Fugas de memoria:
   El manejo de la memoria recae sobre nosotros cuando usamos variables dinámicas.
   La memoria alocatada solo se libera cuando:
  - usamos deallocate
  - se termina el programa

 Las variables *LOCALES* (dentro de subrutinas y funciones) tienen que ser desalocatadas al final del procedimiento!!
Con `ALLOCATED(a)` preguntamos si está allocatado.


### Precision y portabilidad: **`KIND`**

Los posibles estados de las unidades basicas que conforman la memoria de una computadora son 2 (llamemosle 0 y 1), por lo tanto cualquier dataype que querramos representar con la computadora va a construirse con un conjunto de 0s y 1s (que comparten un mismo adress, un mismo espacio en la memoria). A la unidad de informacion que puede se almacenada en una de estas unidades de memoria se lo conoce como **bit**.

Ocurre aveces que en distintas maquinas o en distintos compiladores que el numero de bits usado para representar a los distintos datatypes puede ser distinta. Esto trae problemas de compatibilidad entre equipos y compiladores. 

FORTRAN para evitar estos problemas permite definir la memoria asignada para representar cualquier datatype mediante la asignacion de un valor entero conocido como **`kind`**. Este representa el espacio de memoria que va a ocupar la variable (en bits).

Para representar numeros enteros **`INTEGER`** se utiliza 1 bit para definir al signo (+/-) y el resto de bits para construir el numero enteroen base 2 o binaria. 

|bits|**`kind`**|nombre | rango (sin signo)		    | rango (con signo)			                                                |
|:---|--------- |:------|:---------------------------------:  |:--------------------------------------------------------- |
|1   |	-       |bit	  |2<sup>1 </sup>=2		                  |+/-				    			                                      |
|8   |	1       |byte   |2<sup>8 </sup>=256 		              |+/- 2<sup>7 </sup>=(-128;127) 	    			                  |
|16  |	2       |half   |2<sup>16</sup>=65536 		            |+/- 2<sup>15</sup>=(-32768;32767) 		   		                |
|32  |	4       |single |2<sup>32</sup>=4294967296	          |+/- 2<sup>31</sup>=(-2147483648;2147489647)	 	            |
|64  |	8       |double |2<sup>64</sup>=18446744073709551616  |+/- 2<sup>63</sup>=(-9223372036854775808;922372036854775807) |

La sintaxis es simplemente:
```fortran
	implicit none
	integer(kind=1)	:: i8
	integer(kind=2)	:: i16
	integer(kind=4)	:: i32
	integer(kind=8)	:: i64
```
Lamentablemente, tambien ocurre que el codigo de `kind` significa distintas cosas en distintos compiladores. Para resolver definitivamente esto inventaron una funcion `SELECTED_INT_KIND(R)` que devuelve el kind necesario para representar numeros en el intervalo (10<sup>-R</sup> ; 10<sup>R</sup>).

Los puntos flotante (**`REAL`**) consisten en el signo **s**, la mantisa **m** (o precision) y el exponente **e** (o rango).x=<b>s</b> <b>m</b>10<sup><b>e</b></sup>. Segun el formato estandarizado en la IEEE, la asignacion de bits para cada cada uno es:

|punto flotante|signo|exponente|mantisa|
|:-------------|:---:|:-------:|:-----:|
|32 bits       |1    | 8       | 23    | 
|64 bits       |1    | 11      | 52    |

Esto tiene algunas consecuencias de redondeo que harian que querramos usar otro sistema. FORTRAN permite definirlo utilizando el comando `SELECTED_REAL_KIND(m,e)`. donde **m**=mantisa y **e**=exponente.

```fortran
   integer, parameter  :: mi_kind = SLECTED_REAL_KIND(30,10)
   real(kind=mi_kind)  :: x
```

Para numeros complejos **`COMPLEX`** la idea es la misma, solo que el tamaño real será del doble del `kind` asignado ya que almacena un punto flotante para la parte real y otro para la parte imaginaria.

Los strings o **`CHARACTER`** tambien se representan con numeros enteros. Cada simbolo tiene asignado un numero natural. Hay distintos estandares, el mas conocido “ASCII”  (*American Standard Code for Information Interchange*) que es el que utiliza FORTAN por default. Para elegir otro sistema se utiliza el comando `SELECT_CHAR_KIND("OTRO_SYSTEMA")`, por ejemplo:

```fortran
  implicit none
  integer, parameter :: ucs4  = selected_char_kind ('ISO_10646')
  character(kind=ucs4, len=26) :: mensaje
```

## Estructuras

Una estructura es una colección de una ó más variables agrupadas bajo el mismo nombre. Son una buena herramienta para organizar datos complejos

```fortran
type punto
    real  :: x,y
end type


! Definción de estructura "rectangulo"
type rectangulo{
	type(punto) :: pt1
	type(punto) :: pt2
end type

```

Para llamar a una variable dentro de una estructura la sintaxis es:

```fortran
type(rectangulo) :: pantalla

print*,"Vertice de pantalla: ",pantalla%pt1%x,pantalla%$pt1%y
```

Es posible definir funciones sobre estructuras:

```fortran
function punto makePoint(x,y) result(tmp)
	implicit none
	type (punto) :: tmp
        real :: x, y
	tmp%x=x
	tmp%y=y
end function
```

