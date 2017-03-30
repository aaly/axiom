add_executable(axiom-traceroute axiom-traceroute.c)
add_dependencies(axiom-traceroute axiom_user_library)
target_link_libraries(axiom-traceroute axiom_user_library)

install(TARGETS axiom-traceroute
        RUNTIME DESTINATION /usr/bin)
