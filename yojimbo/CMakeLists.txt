add_library(yojimbo STATIC)

target_include_directories(yojimbo PUBLIC "include/")
target_sources(
  yojimbo
  PRIVATE
    src/netcode.cpp
    src/reliable.cpp
    src/tlsf.cpp
    src/yojimbo.cpp
)

set_target_properties(
  yojimbo
    PROPERTIES
      COMPILE_FLAGS
        ""
    POSITION_INDEPENDENT_CODE ON
)

target_link_libraries(yojimbo sodium)
