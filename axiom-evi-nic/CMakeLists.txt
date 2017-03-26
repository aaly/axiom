cmake_minimum_required (VERSION 2.8.11)
#message( STATUS "Building axiom-evi-nic ;)" )

include_directories(include/) #for all
include_directories(axiom_netdev_driver/) #for axiom_user_library

add_subdirectory (axiom_netdev_driver)
add_subdirectory (axiom_switch)
add_subdirectory (axiom_user_library)


