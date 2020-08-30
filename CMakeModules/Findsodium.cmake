if (PULCHER_PLATFORM STREQUAL Win64)
  set(SODIUM_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/libsodium/libsodium-win64/)
elseif (PULCHER_PLATFORM STREQUAL Linux)
  set(SODIUM_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/libsodium/libsodium-linux/)
endif()

message("PULCHER PLATFORM ${PULCHER_PLATFORM}")

add_library(sodium STATIC IMPORTED)

set_target_properties(
  sodium
    PROPERTIES
      IMPORTED_LOCATION ${SODIUM_ROOT}/lib/libsodium.a
      INTERFACE_INCLUDE_DIRECTORIES ${SODIUM_ROOT}/include
)
