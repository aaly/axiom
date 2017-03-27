add_executable (axiom-allocator-test axiom-allocator-test.c)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ../../axiom-allocator/allocator.lds.x86")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ../../axiom-evi-allocator-lib/src/xs_mapx86.lds")

add_dependencies(axiom-allocator-test axiom-allocator axiom-allocator-library)
target_link_libraries (axiom-allocator-test LINK_PUBLIC axiom-allocator axiom-allocator-library)

