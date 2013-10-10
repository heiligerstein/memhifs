#!/bin/bash

#ctags -R --language-force=C memcachefs.c \
#./config.h \
#/usr/include/stdio.h \
#/usr/include/stdlib.h \
#/usr/include/string.h \
#/usr/include/unistd.h \
#/usr/include/errno.h \
#/usr/include/fcntl.h \
#/usr/include/libgen.h \
#/usr/include/limits.h \
#/usr/include/sys/stat.h \
#/usr/include/sys/types.h \
#/usr/include/sys/socket.h \
#/usr/include/netinet/in.h \
#/usr/include/arpa/inet.h \
#/usr/include/netdb.h \
#/usr/include/fuse/fuse.h \
#/usr/include/memcache.h \
#./memcachefs.h \
#./handle.h

# ./ctags_with_dep.sh file1.c file2.c ... to generate a tags file for these
# files.

gcc -D_FILE_OFFSET_BITS=64 -M $* | sed -e 's/[\\ ]/\n/g' | \
        sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
        ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
