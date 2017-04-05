add_custom_target(Nanox ALL
		  DEPENDS Extrae GASNET)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")


#========================= DEBUG ========================

add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure --disable-performance --with-gasnet=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/
						      --with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/include/gasnet-debug
			      			      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/lib/gasnet-debug
#--with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet/include
#--with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet/lib/
						      --disable-instrumentation --disable-instrumentation-debug CXXFLAGS='-fPIC' CFLAGS='-fPIC')

add_custom_command(TARGET "Nanox"
                   COMMAND make install CXXFLAGS='-fPIC' CFLAGS='-fPIC' DESTDIR=${installdir})

#========================= Performane========================






add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure
                                                     #--with-gasnet=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet/
                                                      --with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/include/gasnet-performance/
                                                      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/lib/gasnet-performance/
#                                                      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/gasnet/lib/
                                                      --disable-instrumentation --disable-instrumentation-debug --disable-debug)
add_custom_command(TARGET "Nanox"
                   COMMAND make install DESTDIR=${installdir})

#========================= Instrumentation ========================



add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure  --disable-debug  --disable-performance
                                                     #--with-gasnet=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet/
                                                      --with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/include/gasnet-instrumentation/
                                                      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/lib/gasnet-instrumentation/)
#                                                      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/gasnet/lib/

add_custom_command(TARGET "Nanox"
                   COMMAND make install DESTDIR=${installdir})



install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
