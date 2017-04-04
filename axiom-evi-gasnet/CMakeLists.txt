#make MANUAL_LIBCFLAGS=... Flags to add on the C compile for the GASNet libs
#    make MANUAL_CFLAGS=...    Flags to add on the C compile for GASNet clients & tests
#    make MANUAL_LDFLAGS=...   Linker flags to add for GASNet clients & tests
#    make MANUAL_LIBS=...   

add_custom_target(GASNET ALL
		  DEPENDS axiom_run_api axiom_init_api axiom_common axiom_user_library
			  axiom_switch axiom-allocator axiom_allocator_l1 axiom_allocator_l2)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

add_custom_command(TARGET GASNET
                   COMMAND ./Bootstrap -y && ./configure --enable-udp --enable-debug --enable-trace --enable-backtrace --disable-parsync  --disable-smp --disable-pshm --disable-psm 
							 --build='x86_64-unknown-linux-gnu' --includedir=/usr/include/)

add_custom_command(TARGET GASNET
                   COMMAND make install MANUAL_LIBCFLAGS='-fPIC' MANUAL_CFLAGS='-fPIC' MANUAL_LDFLAGS='-fPIC' MANUAL_LIBS='-fPIC' SEPARATE_CC=1 DESTDIR=${installdir})

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)


# configure.in 
#  axiom_libraries_CFLAGS="-I/home/abdallah/tmppp/axiom/axiom-evi-nic/include -I/home/abdallah/tmppp/axiom/axiom-evi-apps/include -I/home/abdallah/tmppp/axiom/axiom-allocator/include -I/home/abd$
##  AC_SUBST([axiom_libraries_CFLAGS])
#  evidence_lmm_CFLAGS="-I/home/abdallah/tmppp/axiom/axiom-evi-nic/include -I/home/abdallah/tmppp/axiom/axiom-evi-apps/include -I/home/abdallah/tmppp/axiom/axiom-allocator/include -I/home/abdall$
#  AC_SUBST([evidence_lmm_CFLAGS])

