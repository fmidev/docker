#!/bin/bash -ex


ls -l /ccache
ls -l /var/cache/yum

test `find /var/cache/yum/ | wc -l` -gt 0
test `find /ccache/ | wc -l` -gt 0

ccache -s

yum install -y gcc

cat >/tmp/in.c <<EOF
#include <stdio.h>

int main(int argc,char *argv[]) {
    printf("arg: %d %s\n",argc,argv[0]);
    return 0;
}
EOF

# Test ccache is working and compilation results end up in there
# Note that this clears ccache ... should use a transient one?
ccache -C
ccache -z
gcc -Wall -c -o /tmp/out.o /tmp/in.c
amount=`ccache -s | fgrep "files in cache" | sed -e 's/^[^0-9]*//'`
test "$amount" -gt "0"
gcc -Wall -c -o /tmp/out.o /tmp/in.c
amount=`ccache -s | fgrep "cache hit (direct)" | sed -e 's/^[^0-9]*//'`
test "$amount" -gt "0"


