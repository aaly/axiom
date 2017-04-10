include_directories(../../axiom-allocator/include/)
add_executable(axiom-rdma axiom-rdma.c)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ../../axiom-allocator/allocator.lds.x86")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ../../axiom-evi-allocator-lib/src/xs_mapx86.lds")

add_dependencies(axiom-rdma axiom_user_api  axiom_allocator axiom_run_api)
target_link_libraries(axiom-rdma axiom_user_api  axiom_allocator axiom_run_api)

install(TARGETS axiom-rdma
        RUNTIME DESTINATION /usr/bin)
