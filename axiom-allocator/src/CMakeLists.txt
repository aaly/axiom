add_library (axiom_allocator_l1 axiom_allocator_l1/axiom_allocator_l1.c)
add_library (axiom_allocator_l2 axiom_allocator_l2/axiom_allocator_l2.c axiom_allocator_l2/axiom_allocator_l1_l2.c)
add_library (axiom-allocator axiom_allocator_l3/axiom_allocator_l3_sw.c  axiom_allocator_l3/axiom_allocator_l2_l3.c axiom_allocator_l3/axiom_allocator_l3_hw.c axiom_allocator.c)

#set(CMAKE_MODULE_LINKER_FLAGS  "-Wl,-T ../allocator.lds.x86")
#set_target_properties(axiom-allocator PROPERTIES LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../allocator.lds.x86)

add_dependencies(axiom-allocator axiom_user_library axiom_run_api axiom-allocator-library)
target_link_libraries(axiom-allocator axiom_user_library axiom_run_api axiom-allocator-library)
target_include_directories (axiom-allocator PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories (axiom_allocator_l1 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_include_directories (axiom_allocator_l2 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})


install(TARGETS axiom-allocator axiom_allocator_l1 axiom_allocator_l2
        ARCHIVE DESTINATION /usr/lib)

