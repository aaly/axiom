add_executable(axiom-netperf axiom-netperf.c)
add_dependencies(axiom-netperf axiom_user_library)
target_link_libraries(axiom-netperf axiom_user_library)

install(TARGETS axiom-netperf
        RUNTIME DESTINATION /usr/bin)
