add_library(fmod INTERFACE)

target_include_directories(fmod INTERFACE include/)


if (PULCHER_PLATFORM STREQUAL "Linux")

set_target_properties(
  fmod
    PROPERTIES
    INTERFACE_LINK_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib/x86_64/libfmod.so
    INTERFACE_LINK_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib/x86_64/libfmodstudio.so
)

install(
  DIRECTORY lib/x86_64/
  DESTINATION lib/
  COMPONENT core
  FILES_MATCHING PATTERN "libfmod*.so*"
)

elseif (PULCHER_PLATFORM STREQUAL "macOS")

set_target_properties(
  fmod
    PROPERTIES
    INTERFACE_LINK_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib/macos/libfmod.dylib
    INTERFACE_LINK_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib/macos/libfmodstudio.dylib
)

install(
  DIRECTORY lib/macos/
  DESTINATION lib/
  COMPONENT core
  FILES_MATCHING PATTERN "libfmod*.dylib*"
)

elseif (PULCHER_PLATFORM STREQUAL "Win64" OR PULCHER_PLATFORM STREQUAL "Win32")

set_target_properties(
  fmod
    PROPERTIES
    INTERFACE_LINK_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib/windows/x86_64/fmod.lib
    INTERFACE_LINK_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/lib/windows/x86_64/fmodstudio_vc.lib
)

install(
  DIRECTORY lib/windows/x86_64/
  DESTINATION lib/
  COMPONENT core
  FILES_MATCHING PATTERN "fmod*.dll*"
)

endif()
