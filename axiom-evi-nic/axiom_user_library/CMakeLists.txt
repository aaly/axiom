cmake_minimum_required (VERSION 2.8.11)

add_library (axiom_user_library axiom_user_api.c axiom_user_test.c )
target_include_directories (axiom_user_library PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})


