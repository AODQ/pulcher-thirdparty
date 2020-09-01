add_library(glad SHARED)

target_include_directories(glad PUBLIC "include/")
target_sources(glad PRIVATE src/glad.cpp)

set_target_properties(glad PROPERTIES POSITION_INDEPENDENT_CODE ON)

target_link_libraries(glad PUBLIC ${CMAKE_DL_LIBS})

install(
  TARGETS glad
  LIBRARY
    DESTINATION lib/
    COMPONENT core
)
