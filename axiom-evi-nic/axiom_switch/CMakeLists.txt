cmake_minimum_required (VERSION 2.8.11)

add_executable(axiom-switch axiom_switch.c axiom_switch_event_loop.c axiom_switch_logic_default.c axiom_switch_topology.c)
target_include_directories (axiom-switch PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(axiom-switch -lm)
install(TARGETS axiom-switch
        RUNTIME DESTINATION /usr/bin)
