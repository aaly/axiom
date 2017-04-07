add_custom_target(MCXX ALL
		  DEPENDS Nanox)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

add_custom_command(TARGET MCXX
                   COMMAND autoreconf -fiv && ./configure --disable-vectorization --disable-analysis
			   --enable-ompss --with-nanox=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nanox/pkg/usr/ --disable-fortran-tests --enable-gperf-regeneration)
#			  --enable-ompss --with-nanox=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nanox/pkg/usr/local --disable-fortran-tests
#			   --host='x86_64-unknown-linux-gnu' --build='x86_64-unknown-linux-gnu' --target='x86_64-unknown-linux-gnu')

add_custom_command(TARGET MCXX
                   COMMAND make install DESTDIR=${installdir})

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
