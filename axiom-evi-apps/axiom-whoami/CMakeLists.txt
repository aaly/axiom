add_executable(axiom-whoami axiom-whoami.c)
add_dependencies(axiom-whoami axiom_user_api)
target_link_libraries(axiom-whoami axiom_user_api)

install(TARGETS axiom-whoami
        RUNTIME DESTINATION /usr/bin)
