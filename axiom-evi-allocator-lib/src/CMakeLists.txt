cmake_minimum_required (VERSION 2.8.11)
add_library (axiom-allocator-library freeidx_list.c init.c)
target_include_directories (axiom-allocator-library PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
