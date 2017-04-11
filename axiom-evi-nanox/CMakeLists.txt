add_custom_target(Nanox ALL)
#		  DEPENDS Extrae GASNET)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")


#========================= DEBUG ========================

add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure --disable-performance --with-gasnet=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet-debug/
						      --with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/include/gasnet-debug
			      			      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/lib/gasnet-debug
						      --disable-instrumentation --disable-instrumentation-debug CXXFLAGS='-fPIC' CFLAGS='-fPIC'
							--prefix=/usr --with-extrae=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-extrae/pkg/usr/
							#CXXFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'							
							#CFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							CPPFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							LDFLAGS='-L${CMAKE_CURRENT_LIST_DIR}/../axiom-allocator/src/ -L${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-allocator-lib/src -L${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/axiom_user_library/')
add_custom_command(TARGET "Nanox"
                   COMMAND make install CXXFLAGS='-fPIC' CFLAGS='-fPIC' DESTDIR=${installdir} && make clean)

#========================= Performane========================


add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure --with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/include/gasnet-performance/
                                                      --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/lib/gasnet-performance/
						      --with-gasnet=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet-performance/
                                                      --disable-instrumentation --disable-instrumentation-debug --disable-debug --with-gasnet=/usr/local/gasnet-performance/
	 					      --prefix=/usr --with-extrae=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-extrae/pkg/usr/
							#CXXFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							#CFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							CPPFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
					              LDFLAGS='-L${CMAKE_CURRENT_LIST_DIR}/../axiom-allocator/src/ -L${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-allocator-lib/src -L${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/axiom_user_library/')

add_custom_command(TARGET "Nanox"
                   COMMAND make install DESTDIR=${installdir} && make clean)

#========================= Instrumentation ========================



add_custom_command(TARGET "Nanox"
                   COMMAND ./bootstrap && ./configure  --enable-debug  --disable-performance --enable-instrumentation-debug
							--with-gasnet=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/local/gasnet-performance/
                                                        --with-gasnet-include=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/include/gasnet-performance/
                                                        --with-gasnet-lib=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-gasnet/pkg/usr/lib/gasnet-performance/
							--prefix=/usr --with-extrae=${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-extrae/pkg/usr/
							#CXXFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							#CFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							CPPFLAGS='-I/${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/include/'
							LDFLAGS='-L${CMAKE_CURRENT_LIST_DIR}/../axiom-allocator/src/ -L${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-allocator-lib/src -L${CMAKE_CURRENT_LIST_DIR}/../axiom-evi-nic/axiom_user_library/')

add_custom_command(TARGET "Nanox"
                   COMMAND make install DESTDIR=${installdir} && make clean)



install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
