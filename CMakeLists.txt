#TODO: check the allocator linker script in src/allocator.lds

# refer to the root source directory of the project as ${AXIOM_SOURCE_DIR} and
# to the root binary directory of the project as ${AXIOM_BINARY_DIR}.

cmake_minimum_required (VERSION 2.8.11)
project (Axiom)

SET(CMAKE_INSTALL_PREFIX "")
SET(sysroot "${CMAKE_CURRENT_LIST_DIR}/sysroot")
SET(destdir "${CMAKE_CURRENT_LIST_DIR}/inst")

add_subdirectory (axiom-evi-gasnet)
add_subdirectory (axiom-evi-extrae)
add_subdirectory (axiom-evi-nanox)
add_subdirectory (axiom-evi-mcxx)
add_subdirectory (axiom-evi-allocator-lib)
add_subdirectory (axiom-allocator)
add_subdirectory (axiom-evi-apps)
add_subdirectory (axiom-evi-allocator-drv)
add_subdirectory (axiom-evi-nic)

#add_custom_command(OUTPUT axiom.deb
#		   COMMAND bash makePkg.sh)
#add_custom_target(pkg ALL DEPENDS axiom.deb)
