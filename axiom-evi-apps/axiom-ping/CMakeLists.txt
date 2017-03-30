add_executable(axiom-ping axiom-ping.c)
add_dependencies(axiom-ping axiom_user_library)
target_link_libraries(axiom-ping axiom_user_library)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

install(TARGETS axiom-ping
        RUNTIME DESTINATION /usr/bin)
