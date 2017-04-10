include_directories(../../axiom-allocator/include/)
include_directories(../..//axiom-evi-apps/axiom_common_library/)
add_subdirectory (lib)
add_executable(axiom-init axiom-init.c axiom-allocator-l1/axiom_allocator_l1.c axiom-pong/axiom_pong.c axiom-spawn/axiom_spawn.c axiom-discovery/axiom_discovery_node.c
		axiom-discovery/axiom_discovery_node.c axiom-discovery/axiom_discovery_protocol.c axiom-discovery/axiom_routing.c axiom-netperf-reply/axiom_netperf_reply.c
		axiom-traceroute-reply/axiom_traceroute_reply.c axiom-session/axiom_session.c)

add_dependencies(axiom-init axiom_user_api axiom-allocator axiom_common axiom_allocator_l1)
target_link_libraries(axiom-init axiom_user_api axiom-allocator axiom_common axiom_allocator_l1)


install(TARGETS axiom-init
        RUNTIME DESTINATION /usr/bin)
