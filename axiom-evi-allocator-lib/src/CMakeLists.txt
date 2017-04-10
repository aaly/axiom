cmake_minimum_required (VERSION 2.8.11)
add_library (evi_lmm freeidx_list.c init.c)
target_include_directories (evi_lmm PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

install(TARGETS evi_lmm
        ARCHIVE DESTINATION /usr/lib)
