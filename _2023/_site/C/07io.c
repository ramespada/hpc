#include <stdio.h>
#include <stdlib.h>

int main(){

   //open / write/ close file
   FILE *fp=fopen("asa.txt","rw");
   char buffer[255];

   fp = fopen("test.txt", "w+");
   fprintf(fp, "Dejo un mensaje...\n");
   fclose(fp);

   //read
   fp = fopen("test.txt", "r");
   fscanf(fp, "%s", buffer);   printf("1 : %s\n", buffer );
   fgets(buffer, 255, (FILE*)fp);   printf("2: %s\n", buffer );
   fclose(fp);

   return 0;
}
