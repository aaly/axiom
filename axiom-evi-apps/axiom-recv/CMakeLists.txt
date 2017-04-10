add_executable(axiom-recv axiom-recv.c)
add_dependencies(axiom-recv axiom_user_api)
target_link_libraries(axiom-recv axiom_user_api)

install(TARGETS axiom-recv
        RUNTIME DESTINATION /usr/bin)
