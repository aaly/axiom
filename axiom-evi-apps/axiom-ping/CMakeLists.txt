add_executable(axiom-ping axiom-ping.c)
target_link_libraries(axiom-ping axiom_user_library)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

