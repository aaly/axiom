add_executable(axiom-info axiom-info.c)
add_dependencies(axiom-info axiom_user_api)
target_link_libraries(axiom-info axiom_user_api)

install(TARGETS axiom-info  
        RUNTIME DESTINATION /usr/bin)
