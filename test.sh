#!/bin/bash -ex

mkdir -p /tmp/shared-ccache
mkdir -p /tmp/shared-yum-cache

docker run -v /tmp/shared-yum-cache:/var/cache/yum fmibase yum update -y
test `find /tmp/shared-yum-cache | wc -l` -gt 0
docker run -v /tmp/shared-yum-cache:/var/cache/yum -v /tmp/shared-ccache:/ccache fmidev ccache -s
test `find /tmp/shared-ccache | wc -l` -gt 0

ls -l /tmp/shared-ccache
ls -l /tmp/shared-yum-cache

