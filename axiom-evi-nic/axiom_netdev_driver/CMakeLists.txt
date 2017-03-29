cmake_minimum_required(VERSION 2.4)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -I../include/")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -I../include/")

# Build the module
EXECUTE_PROCESS(COMMAND uname -r
                OUTPUT_VARIABLE os_release
                OUTPUT_STRIP_TRAILING_WHITESPACE)
SET(module_path /lib/modules/${os_release})
SET(module_build_path ${module_path}/build)

ADD_CUSTOM_COMMAND(OUTPUT axiom_netdev_driver.ko
                   COMMAND make -C ${module_build_path}  M=`pwd`
                   DEPENDS  Kbuild
                   COMMENT "Building axiom_netdev_driver.ko")

ADD_CUSTOM_TARGET(axiom_netdev_driver ALL DEPENDS axiom_netdev_driver.ko axiom_memory_dev axiom_mem_manager)

install(FILES axiom_netdev.ko
        DESTINATION /usr/lib/modules/)
