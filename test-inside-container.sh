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

gcc -Wall -o /tmp/out /tmp/in.c
amount=`ccache -s | fgrep "files in cache" | sed -e 's/^[^0-9]*//'`
test "$amount" -gt "0"


