add_custom_target(Nanox ALL
		  DEPENDS Extrae)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure -with-axiomhome=../ --disable-debug  --disable-performance
                                          --enable-instrumentation --with-extrae=/home/dude/tmp2/axiom/axiom-evi-extrae/pkg/usr/local --disable-instrumentation-debug)

add_custom_command(TARGET "Nanox"
                   COMMAND make install DESTDIR=${installdir})

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
