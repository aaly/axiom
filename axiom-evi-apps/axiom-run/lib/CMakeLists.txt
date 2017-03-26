add_library (libaxiom_run_api SHARED nodes.c  rpc.c  sync.c)

target_include_directories (libaxiom_run_api PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
