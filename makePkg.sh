#!/bin/bash

rm -rf axiom &> /dev/zero

cmake . && make DESTDIR=axiom/  install

mkdir -p axiom/DEBIAN
cp control axiom/DEBIAN
cp postinst axiom/DEBIAN

dpkg-deb --build axiom


