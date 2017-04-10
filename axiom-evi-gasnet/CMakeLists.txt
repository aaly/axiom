

add_custom_target(GASNET ALL
		  DEPENDS axiom_run_api axiom_init_api axiom_common axiom_user_library
			  axiom-allocator axiom_allocator_l1 axiom_allocator_l2)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

add_custom_command(TARGET GASNET
                   COMMAND ./Bootstrap -y && ./configure --enable-udp --enable-debug --enable-trace --enable-backtrace --disable-parsync  --disable-smp --disable-pshm
							 --disable-stats --disable-debug-malloc --disable-system-debug-malloc  --with-target-cxxflags='-fPIC -DGASNETI_FORCE_PIC'
                                                         --build='x86_64-unknown-linux-gnu' --libdir=/usr/lib/gasnet-debug --includedir=/usr/include/gasnet-debug
							--prefix=/usr/local/gasnet-debug)

add_custom_command(TARGET GASNET
                   COMMAND make install MANUAL_LIBCFLAGS='-fPIC -DGASNETI_FORCE_PIC' MANUAL_CXXFLAGS='-fPIC -DGASNETI_FORCE_PIC' MANUAL_CFLAGS='-fPIC -DGASNETI_FORCE_PIC' 
			  MANUAL_LDFLAGS='-fPIC -DGASNETI_FORCE_PIC' MANUAL_LIBS='-fPIC -DGASNETI_FORCE_PIC' SEPARATE_CC=1 DESTDIR=${installdir} && make clean)


#============== no debug for nano performance ===============

add_custom_command(TARGET GASNET
                   COMMAND ./Bootstrap -y && ./configure --enable-udp --enable-smp --disable-debug --disable-parsync  --disable-pshm
							 --disable-stats --disable-debug-malloc --disable-system-debug-malloc
                                                         --build='x86_64-unknown-linux-gnu' --disable-backtrace-ladebug
							 --libdir=/usr/lib/gasnet-performance --includedir=/usr/include/gasnet-performance
							 --prefix=/usr/local/gasnet-performance)

add_custom_command(TARGET GASNET
                   COMMAND make install DESTDIR=${installdir} && make clean)

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
