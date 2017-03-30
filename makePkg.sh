#!/bin/bash

#mkdir -p pkg/

rm -rf pkg &> /dev/zero

cmake . && make DESTDIR=pkg/  install

mkdir -p pkg/DEBIAN
cp control pkg/DEBIAN
cp postinst pkg/DEBIAN

dpkg-deb --build pkg


