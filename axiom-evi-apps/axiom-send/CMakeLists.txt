add_executable(axiom-send axiom-send.c)
add_dependencies(axiom-send axiom_user_api)
target_link_libraries(axiom-send axiom_user_api)

install(TARGETS axiom-send
        RUNTIME DESTINATION /usr/bin)
