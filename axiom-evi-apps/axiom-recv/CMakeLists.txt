add_executable(axiom-recv axiom-recv.c)
add_dependencies(axiom-recv axiom_user_library)
target_link_libraries(axiom-recv axiom_user_library)

