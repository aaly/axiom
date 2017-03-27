add_executable(axiom-whoami axiom-whoami.c)
add_dependencies(axiom-whoami axiom_user_library)
target_link_libraries(axiom-whoami axiom_user_library)

