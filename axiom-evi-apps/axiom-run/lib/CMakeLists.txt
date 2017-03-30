add_library (axiom_run_api SHARED nodes.c  rpc.c  sync.c)
target_include_directories (axiom_run_api PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

install(TARGETS axiom_run_api
        LIBRARY DESTINATION /usr/lib)
