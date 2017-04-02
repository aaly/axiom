#cmake_minimum_required(VERSION 3.7)

add_custom_target(Extrae ALL)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

add_custom_command(TARGET "Extrae"
                   COMMAND autoreconf -fiv && ./configure --without-binutils --disable-xmltest  --enable-nanos --without-mpi --without-unwind
			   --without-dyninst --without-papi --enable-instrument-dynamic-memory --enable-instrument-io --with-sysroot=${sysroot})

add_custom_command(TARGET "Extrae"
                   COMMAND make install DESTDIR=${installdir})

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
