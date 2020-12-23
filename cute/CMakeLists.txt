add_library(cute SHARED)

target_include_directories(cute PUBLIC include/)

target_sources(cute PRIVATE src/cute/cute_c2.cpp)

target_link_libraries(cute)

install(
  TARGETS cute
  LIBRARY
    DESTINATION lib/
    COMPONENT core
)
