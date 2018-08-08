#!/bin/bash -ex

mkdir -p /tmp/shared-ccache
mkdir -p /tmp/shared-yum-cache

docker run -v /tmp/shared-yum-cache:/var/cache/yum yum update -y
test `find /tmp/shared-yum-cache | wc -l` -gt 0
docker run -v /tmp/shared-yum-cache:/var/cache/yum -v /tmp/ccache:/ccache ccache -s
test `find /tmp/ccache | wc -l` -gt 0

ls -l /tmp/ccache
ls -l /tmp/shared-yum-cache

