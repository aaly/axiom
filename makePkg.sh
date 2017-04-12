#!/bin/bash


PKG_NAME="axiom-platform"
rm -rf ${PKG_NAME} &> /dev/zero

cmake . && make DESTDIR= ${PKG_NAME}  install

mkdir -p  ${PKG_NAME}/DEBIAN
cp control  ${PKG_NAME}/DEBIAN
cp postinst  ${PKG_NAME}/DEBIAN

dpkg-deb --build ${PKG_NAME}


