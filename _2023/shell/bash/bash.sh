#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## Part IV –  B A S H  -  S C RI P T S
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 24 -  Primer Script
#Un script es un archivo con una serie de comandos. La consola lee el script y ejecuta los comandos.
# Pasos:
#   i   - Escribirlo en un archivo de texto ordinario. (vim, gedit, kate, etc.)
#   ii  - Hacer el script ejecutable: chmod 755 mi_script
#   iii - Poner el script donde la shell pueda encontrarlo.
#   iv  - Ejecutarlo: 	./mi_script

#Formato:
#debe comenzar con:
#!/bin/bash
		#! = "shebang" le dice al sistema el nombre del interprete que serpa usado para ejecutar el script.
#Luego van los comandos.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 25 -  Comenzar un proyecto
# Hacer un generador de informes.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 26 -  Diseño top-down
function f(){
	<commandos>
	local var_local
	return
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 27 -  Flow Control:  "IF"

if [ condition ]; then
	commands
elif [ condition ]; then
	commands
else
	commands
fi

●  test 

[[ expression ]]

(( )) 

Operadores lógicos:
    test    [[ ]] y (( ))
AND  -a 	 &&
OR   -o 	 ||
NOT  !		 !
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 28 -  R E A D I N G -  K E Y B O A R D - I N P U T

●  read
    - Options
	-a array Assign the input to array.
	-d delimiter
	-e Use Readline to handle input. 
	-n num.
	-p prompt.
	-r Raw mode. 
	-s Silent mode.
	-t seconds Timeout.
	-u fd Use input from file descriptor fd , rather than standard input.

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 29 -  Flow Control:  "WHILE" y "UNTIL"
x=-2

while [ $x -le 10 ]; do
	if [ $x == 0 ]; then
		echo "Probando comando 'WHILE'"
		echo $x
		x=$((x + 1))
	else
		echo $x
		x=$((x + 1))
	fi

done

x=-2

until [ $x -gt 10 ]; do
	if [ $x == 0 ]; then
		echo "Probando comando 'UNTIL'"
		echo $x
		x=$((x + 1))
	else
		echo $x
		x=$((x + 1))
	fi

done
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 30 -  TROUBLESHOOTING

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 31 -  Flow Control:  "CASE"
x=22
case $x in
	0)	echo "Es cero".
		exit
		;;
	1)	echo "Es uno".
		exit
		;;
	[2-6])	echo "Esta entre 2-6".
		exit
		;;
	"hola")	echo "Todo bien?".
		exit
		;;
	*)	echo "Otra cosa."
		exit
		;;
esac
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 32 -  Parámetros posicionales

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 33 -  Flow Control: "FOR"
for i in {F..I} ; do
	for j in {1..4}; do
		echo $i$j;
	done
done
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 34 -  Strings y Numbers

- Expansiones:
	- Param básicos:
		a="hola"
		echo {$a }  #(los {} son opcionales)

	- Expansiones de variables vacias.
		${param:-"substituto"} # Imprime subst si param no está definida
		${param:="default"} # Da valor default si param no está definida.
		${param:?"está definida?"} # Booleano para saber si está o no definida.
	
	- Expansiones que retornan nombre de variables.
		${!prefix*}	
		${!prefix@}

## - Operaciones en Strings.
	${#foo}  = # caracteres del string.
	${foo:i:j} devuelve del car i-esimo hasta el j-estimo.
	${foo#*PATH} corta el string hasta el primer PATH
	${foo##*PATH} corta el string hasta el ultimo PATH
	${foo%*PATH} como "#" pero empezando desde el final.
	${foo%%*PATH} mo "##" pero empezando desde el final
	# Reemplazo
	${foo/PATH/REEMPLAZO}
	${foo//PATH/REEMPLAZO}
	${foo/#PATH/REEMPLAZO}
	${foo/%PATH/REEMPLAZO}


## -  Expansiones Aritméticas.
	$(( expresion ))

	- Bases: $((base#numero)) 
		
	- Operadores:
		Operator Description
		+ 	Addition
		- 	Subtraction
		* 	Multiplication
		/ 	Integer division
		** 	Exponentiation
		% 	Resto


	- Operadores de asignación:
p = val		Asignación simple.
p=+ val		Addición (vale sustracc, mult y div tamb)



- Operadores de bits
~ 	negacion
<<	left shift
>>	right shift
&	AND
|	OR
^	XOR

- Comparasión
<= Less than or equal to
>= Greater than or equal to
< Less than
> Greater than
== Equal to
= Not equal to
&& Logical AND
|| Logical OR
expr1?expr2:expr3 Comparison (ternary) operator. If expression expr1 evaluates to be non-zero (arithmetic true) then expr2 , else expr3 .

- "Calculadora":
● bc

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
## 35 -  Arrays

name=(value1 value2 ...)

name[subscript]=value

- Operaciones con arrays:

	${array[@]}  # ver sus elementos.
	${#a[@]} # number of array elements

	foo+=(d e f) # agregar elementos a array.
	unset "foo[i]" # sacar el elemento i-esimo.


