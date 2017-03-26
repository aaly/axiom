include_directories(../../axiom-allocator/include/)
include_directories(../axiom_common_library/)
add_subdirectory (lib)
add_executable(axiom-run axiom-run.c master.c slave.c rpcfuncs.c)
target_link_libraries(axiom-run  libaxiom_common axiom_user_library axiom-allocator libaxiom_run_api libaxiom_init_api libaxiom_allocator_l2)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")


