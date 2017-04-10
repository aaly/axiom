add_executable(axiom-ping axiom-ping.c)
add_dependencies(axiom-ping axiom_user_api)
target_link_libraries(axiom-ping axiom_user_api)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

install(TARGETS axiom-ping
        RUNTIME DESTINATION /usr/bin)
