
add_library (libaxiom_common daemonize daemonize.c logmsg.c strlcat.c strlcpy.c strlist.c)
#target_link_libraries (libaxiom_common LINK_PUBLIC axiom-evi-apps)

