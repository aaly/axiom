cmake_minimum_required (VERSION 2.8.11)

include_directories(include)
include_directories(../axiom-evi-nic/include)


add_subdirectory (axiom_common_library)
add_subdirectory (axiom-init)
add_subdirectory (axiom-ping)
add_subdirectory (axiom-recv)
add_subdirectory (axiom-send)
add_subdirectory (axiom-utility)
add_subdirectory (axiom-info)
add_subdirectory (axiom-netperf)
add_subdirectory (axiom-rdma)
add_subdirectory (axiom-run)
add_subdirectory (axiom-traceroute)
add_subdirectory (axiom-whoami)
#add_subdirectory (tests)


install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/include/ DESTINATION /usr/include
        USE_SOURCE_PERMISSIONS)
