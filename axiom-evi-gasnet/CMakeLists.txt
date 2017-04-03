add_custom_target(GASNET ALL
		  DEPENDS axiom_run_api axiom_init_api axiom_common axiom_user_library
			  axiom_switch axiom-allocator axiom_allocator_l1 axiom_allocator_l2)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

${CMAKE_CURRENT_LIST_DIR}/axiom-evi-apps/include/;${CMAKE_CURRENT_LIST_DIR}/axiom-evi-nic/include/;${CMAKE_CURRENT_LIST_DIR}/axiom-allocator/include/
add_custom_command(TARGET GASNET
                   COMMAND ./Bootstrap -y && ./configure --enable-udp --enable-debug --enable-trace --enable-backtrace --disable-parsync  --disable-smp --disable-pshm --disable-psm 
							 --with-axiom-sysroot=/ --with-axiom-host=/ --build='x86_64-unknown-linux-gnu'
							 --includedir=${CMAKE_CURRENT_LIST_DIR}/axiom-evi-apps/include/,${CMAKE_CURRENT_LIST_DIR}/axiom-evi-nic/include/,${CMAKE_CURRENT_LIST_DIR}/axiom-allocator/include/ 
	                  --libdir=${CMAKE_CURRENT_LIST_DIR}/axiom-evi-apps/include/,${CMAKE_CURRENT_LIST_DIR}/axiom-evi-nic/include/,${CMAKE_CURRENT_LIST_DIR}/axiom-allocator/include/
			--includedir=/usr/include/)

add_custom_command(TARGET GASNET
                   COMMAND make install DESTDIR=${installdir})

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)


# configure.in 
#  axiom_libraries_CFLAGS="-I/home/abdallah/tmppp/axiom/axiom-evi-nic/include -I/home/abdallah/tmppp/axiom/axiom-evi-apps/include -I/home/abdallah/tmppp/axiom/axiom-allocator/include -I/home/abd$
##  AC_SUBST([axiom_libraries_CFLAGS])
#  evidence_lmm_CFLAGS="-I/home/abdallah/tmppp/axiom/axiom-evi-nic/include -I/home/abdallah/tmppp/axiom/axiom-evi-apps/include -I/home/abdallah/tmppp/axiom/axiom-allocator/include -I/home/abdall$
#  AC_SUBST([evidence_lmm_CFLAGS])

