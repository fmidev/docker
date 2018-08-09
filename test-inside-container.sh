#!/bin/bash -ex


ls -l /ccache
ls -l /var/cache/yum

test `find /var/cache/yum/ | wc -l` -gt 0
test `find /ccache/ | wc -l` -gt 0


