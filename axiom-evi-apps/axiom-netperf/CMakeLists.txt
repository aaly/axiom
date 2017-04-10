add_executable(axiom-netperf axiom-netperf.c)
add_dependencies(axiom-netperf axiom_user_api)
target_link_libraries(axiom-netperf axiom_user_api)

install(TARGETS axiom-netperf
        RUNTIME DESTINATION /usr/bin)
