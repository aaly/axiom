add_executable(axiom-utility axiom-utility.c)
target_link_libraries(axiom-utility axiom_user_library)

install(TARGETS axiom-utility
        RUNTIME DESTINATION /usr/bin)
