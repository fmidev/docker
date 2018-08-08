#!/bin/bash -ex


ls -l /tmp/ccache
ls -l /tmp/shared-yum-cache

test `find /tmp/shared-yum-cache | wc -l` -gt 0
test `find /tmp/ccache | wc -l` -gt 0


