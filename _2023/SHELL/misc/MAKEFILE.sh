#===   M A K E F I L E   ===
#	targets : prerequisities
#	   command
#	   command
#	   command


#Example:
# Since the blah target is first, it is the default target and will be run when we run "make"
blah: blah.o
	cc blah.o -o blah

blah.o: blah.c
	cc -c blah.c -o blah.o

blah.c:
	echo "int main() { return 0; }" > blah.c

clean:
	rm -f blah.o blah.c blah
