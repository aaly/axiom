add_executable (testA testA.c)
add_executable (testB testB.c)
add_executable (testFreelist testFreelist.c)
#add_executable (aarch64_allocator_test aarch64_allocator_test.c)

add_dependencies(testA evi_lmm)
add_dependencies(testB evi_lmm)
add_dependencies(testFreelist evi_lmm)
target_link_libraries (testA LINK_PUBLIC evi_lmm)
target_link_libraries (testB LINK_PUBLIC evi_lmm)
target_link_libraries (testFreelist LINK_PUBLIC evi_lmm)
#target_link_libraries (aarch64_allocator_test LINK_PUBLIC axiom-allocator-library)

install(TARGETS testA testB testFreelist
        RUNTIME DESTINATION /usr/bin)

