include_directories(../../axiom-allocator/include/)
add_executable(axiom-rdma axiom-rdma.c)

#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ../../axiom-allocator/test/allocator.lds.x86")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ../../axiom-evi-allocator-lib/src/xs_mapx86.lds")

target_link_libraries(axiom-rdma axiom_user_library  axiom-allocator libaxiom_run_api)

