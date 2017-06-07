TIMESTAMP = `date +%Y%m%d`
RUNZIPFILE32 = /tmp/proxy-libintl_$(TIMESTAMP)_win32.zip
RUNZIPFILE64 = /tmp/proxy-libintl_$(TIMESTAMP)_win64.zip
DEVZIPFILE32 = /tmp/proxy-libintl-dev_$(TIMESTAMP)_win32.zip
DEVZIPFILE64 = /tmp/proxy-libintl-dev_$(TIMESTAMP)_win64.zip

CC = gcc
CPPFLAGS = -I ../../include
OPTIMIZE = -O2
CFLAGS = -Wall $(CPPFLAGS) $(OPTIMIZE)

X64CC = x86_64-w64-mingw32-gcc

X64MSVC = cl

all : \
	../../lib/libintl.a 		\
	../../lib/intl.lib		\
	../../win64/include/libintl.h	\
	../../win64/lib/libintl.a	\
	../../win64/lib/intl.lib

../../lib/libintl.a : libintl.o
	ar rc $@ libintl.o

../../lib/intl.lib : ../../lib/libintl.a
	cp ../../lib/libintl.a $@
	strip --strip-unneeded $@

../../win64/include/libintl.h : ../../include/libintl.h
	mkdir -p `dirname $@`
	cp -p ../../include/libintl.h $@

../../win64/lib/libintl.a : libintl.x64.o
	mkdir -p `dirname $@`
	x86_64-w64-mingw32-ar rc $@ libintl.x64.o

../../win64/lib/intl.lib : libintl.vs.x64.o
	mkdir -p `dirname $@`
	lib -machine:x64 -out:$@ libintl.vs.x64.o

libintl.o : libintl.c
	$(CC) $(CFLAGS) -c libintl.c

libintl.x64.o : libintl.c
	$(X64CC) $(CFLAGS) -c -o $@ libintl.c

libintl.vs.x64.o : libintl.c
	$(X64MSVC) -MD $(CPPFLAGS) -c -Fo$@ libintl.c

clean :
	rm -rf *.o ../../lib/* ../../win64 $(DEVZIPFILE32) $(DEVZIPFILE64)

dist : clean all
	(cd ../.. && \
	rm -f $(RUNZIPFILE32) $(RUNZIPFILE64) && \
	zip $(RUNZIPFILE32) nul && zip -d $(RUNZIPFILE32) nul && \
	zip $(RUNZIPFILE64) nul && zip -d $(RUNZIPFILE64) nul && \
	rm -f $(DEVZIPFILE32) $(DEVZIPFILE64) && \
	zip $(DEVZIPFILE32) include/libintl.h lib/{libintl.a,intl.lib} src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.c} )
	(cd ../../win64 && \
	zip $(DEVZIPFILE64) include/libintl.h && \
	zip $(DEVZIPFILE64) lib/{libintl.a,intl.lib} )
	(cd ../.. && \
	zip $(DEVZIPFILE64) src/proxy-libintl/{README.txt,COPYING.LIB.txt,Makefile,libintl.c} )
	manifestify $(RUNZIPFILE32) $(RUNZIPFILE64) $(DEVZIPFILE32) $(DEVZIPFILE64)
