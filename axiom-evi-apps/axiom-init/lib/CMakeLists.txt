add_library (axiom_init_api SHARED execvpe.c)
target_include_directories (axiom_init_api PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

install(TARGETS axiom_init_api
        LIBRARY DESTINATION /usr/lib)
