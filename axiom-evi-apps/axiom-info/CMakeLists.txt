add_executable(axiom-info axiom-info.c)
add_dependencies(axiom-info axiom_user_library)
target_link_libraries(axiom-info axiom_user_library)

install(TARGETS axiom-info  
        RUNTIME DESTINATION /usr/bin)
