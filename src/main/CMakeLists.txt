aux_source_directory(. SRCS)
add_executable(Xserver ${SRCS})
target_link_libraries(Xserver base network)

install(TARGETS Xserver RUNTIME DESTINATION ${PROJECT_SOURCE_DIR}/bin/sbin)