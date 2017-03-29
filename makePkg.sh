#!/bin/bash

mkdir -p pkg/usr/lib/
cp /home/dude/tmp/axiom/axiom-allocator/src/usr/lib/libaxiom-allocator.a pkg/usr/lib/

mkdir -p pkg/DEBIAN
cp control pkg/DEBIAN

dpkg-deb --build pkg


