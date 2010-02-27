#!/bin/sh

prefix=/usr/local/opencv
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include/opencv



if [[ $# > 0 ]] ; then
	base=`basename $1 .c`
	echo "compiling $base"
	gcc -ggdb -L${libdir} -lcv -lhighgui -lcvaux -lml -lcxcore $base.c -o $base 
else
	for i in *.c; do
	    echo "compiling $i"
	    gcc -ggdb -L${libdir} -lcv -lhighgui -lcvaux -lml -lcxcore -o `basename $i .c` $i -I${includedir};
	done
	for i in *.cpp; do
	    echo "compiling $i"
	    g++ -ggdb -L${libdir} -lcv -lhighgui -lcvaux -lml -lcxcore -o `basename $i .cpp` $i -I${includedir};
	done
fi
