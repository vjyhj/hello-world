.PHONY: all clean install uninstall
CC=gcc
all:eight

%.o:%.c
		$(CC) -c -o $@ $<
	
clean:
		rm -rf eight *.o *.so

eight: main.o libfunc.so
		$(CC) -o eight main.o -L. -lfunc -Wl,-rpath,. 

libfunc.so: func.o
		$(CC) -shared -o libfunc.so func.o
install:
		install ./eight /usr/local/bin
uninstall:
		rm -rf /usr/local/bin/eight
