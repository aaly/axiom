include_directories(../../axiom-allocator/include/)
include_directories(../axiom_common_library/)
add_subdirectory (lib)
add_executable(axiom-run axiom-run.c master.c slave.c rpcfuncs.c)
add_dependencies(axiom-run  axiom_common axiom_user_library axiom-allocator axiom_run_api axiom_init_api axiom_allocator_l2)
target_link_libraries(axiom-run  axiom_common axiom_user_library axiom-allocator axiom_run_api axiom_init_api axiom_allocator_l2)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")


install(TARGETS axiom-run
        RUNTIME DESTINATION /usr/bin)
