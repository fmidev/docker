#!/bin/bash -ex

cd `dirname $0`
testfile=.buildage

# Force rebuild without cache every 24 hours
test ! -r "$testfile" || (
    if [ `stat --format=%Y $testfile` -le $(( `date +%s` - 86400 )) ] ; then
	rm -f "$testfile"
    fi
    )

param=""
test ! -e "$testfile" && param="--no-cache"

for i in * ; do
    test ! -d $i || ( cd $i ; docker build $param -t $i . )
done

# Create timestamp with current time if not already there
test ! -e "$testfile" && touch "$testfile"
