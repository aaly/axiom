cmake_minimum_required (VERSION 2.8.11)

add_library(axiom_switch axiom_switch.c axiom_switch_event_loop.c axiom_switch_logic_default.c axiom_switch_topology.c)
target_include_directories (axiom_switch PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})


