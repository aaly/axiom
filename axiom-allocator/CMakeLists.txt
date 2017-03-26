cmake_minimum_required (VERSION 2.8.11)

include_directories(include/)
include_directories(../axiom-evi-allocator-drv/)
include_directories(../axiom-evi-allocator-lib/src/)
include_directories(../axiom-evi-apps/include/)
include_directories(../axiom-evi-nic/include/)


add_subdirectory (src)
add_subdirectory (test)

