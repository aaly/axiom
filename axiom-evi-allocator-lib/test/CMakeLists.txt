add_executable (testA testA.c)
add_executable (testB testB.c)
add_executable (testFreelist testFreelist.c)
#add_executable (aarch64_allocator_test aarch64_allocator_test.c)

target_link_libraries (testA LINK_PUBLIC axiom-allocator-library)
target_link_libraries (testB LINK_PUBLIC axiom-allocator-library)
target_link_libraries (testFreelist LINK_PUBLIC axiom-allocator-library)
#target_link_libraries (aarch64_allocator_test LINK_PUBLIC axiom-allocator-library)

