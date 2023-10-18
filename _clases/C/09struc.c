#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Stucts.
//
// cuando neecesito mas de una variable para describir un objeto.
// puede almacenar datosde disinto tipo
//



//struct perro{
//         const char *name
//	 const char *raza
//	 int Altura
//	 int Peso
//};
//
//typedef sturct C

typedef struct{
         const char *name;
	 const char *raza;
	 int hgt;
	 float wgt;
} perro;



void main(){

	//struct perro pochis = {"Pochis", "Caniche", 50, 3.2}
	perro pochis = {"Pochis", "Caniche", 50, 3.2};
	
	printf("El perro se llama *%s*, es de raza %s, su altura es: %i y pesa %.1f.\n",pochis.name,pochis.raza,pochis.hgt,pochis.wgt);
	
}
