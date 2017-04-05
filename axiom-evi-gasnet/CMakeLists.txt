add_custom_target(GASNET ALL
		  DEPENDS axiom_run_api axiom_init_api axiom_common axiom_user_library
			  axiom_switch axiom-allocator axiom_allocator_l1 axiom_allocator_l2)

SET(installdir "${CMAKE_CURRENT_LIST_DIR}/pkg")

add_custom_command(TARGET GASNET
#                   COMMAND ./Bootstrap -y && ./configure --enable-cross-compile --enable-udp --enable-debug --enable-trace --enable-backtrace --disable-parsync  --disable-smp --disable-pshm 
                   COMMAND ./Bootstrap -y && ./configure --enable-udp --enable-debug --enable-trace --enable-backtrace --disable-parsync  --disable-smp --disable-pshm
							 --disable-stats --disable-debug-malloc --disable-system-debug-malloc  --with-target-cxxflags='-fPIC -DGASNETI_FORCE_PIC'
#							 --build='x86_64-unknown-linux-gnu' --includedir=/usr/include/ CROSS_PAGESIZE='4096' CROSS_HAVE_MMAP='1')
                                                         --build='x86_64-unknown-linux-gnu' --libdir=/usr/lib/gasnet-debug --includedir=/usr/include/gasnet-debug )

add_custom_command(TARGET GASNET
                   COMMAND make install MANUAL_LIBCFLAGS='-fPIC -DGASNETI_FORCE_PIC' MANUAL_CXXFLAGS='-fPIC -DGASNETI_FORCE_PIC' MANUAL_CFLAGS='-fPIC -DGASNETI_FORCE_PIC' 
			  MANUAL_LDFLAGS='-fPIC -DGASNETI_FORCE_PIC' MANUAL_LIBS='-fPIC -DGASNETI_FORCE_PIC' SEPARATE_CC=1 DESTDIR=${installdir})


#============== no debug for nano performance ===============

add_custom_command(TARGET GASNET
                   COMMAND ./Bootstrap -y && ./configure --disable-udp --disable-smp --disable-debug --disable-parsync  --disable-pshm
							 --disable-stats --disable-debug-malloc --disable-system-debug-malloc
                                                         --build='x86_64-unknown-linux-gnu' --disable-backtrace-ladebug
							 --libdir=/usr/lib/gasnet-performance --includedir=/usr/include/gasnet-performance)
#--disable-aligned-segments --disable-seq --with-mpi-cc="mpicc -fPIC -DPIC" MANUAL_LIBCFLAGS='-fPIC -DPIC -DGASNETI_FORCE_PIC' MANUAL_CXXFLAGS='-DPIC -fPIC -DGASNETI_FORCE_PIC' MANUAL_CFLAGS='-DPIC -fPIC -DGASNETI_FORCE_PIC' 
#                          MANUAL_LDFLAGS='-DPIC -fPIC -DGASNETI_FORCE_PIC' MANUAL_LIBS='-DPIC -fPIC -DGASNETI_FORCE_PIC')

add_custom_command(TARGET GASNET
                   COMMAND make install DESTDIR=${installdir})

install(DIRECTORY ${installdir}/ DESTINATION /
	USE_SOURCE_PERMISSIONS)
