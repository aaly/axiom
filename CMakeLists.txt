#TODO: check the allocator linker script in src/allocator.lds

# refer to the root source directory of the project as ${AXIOM_SOURCE_DIR} and
# to the root binary directory of the project as ${AXIOM_BINARY_DIR}.

cmake_minimum_required (VERSION 2.8.11)
project (Axiom)

add_subdirectory (axiom-evi-allocator-lib)
add_subdirectory (axiom-allocator)
add_subdirectory (axiom-evi-apps)
add_subdirectory (axiom-evi-allocator-drv)
add_subdirectory (axiom-evi-nic)



