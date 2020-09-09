add_library(sokol SHARED)

target_include_directories(sokol PUBLIC include/)

target_sources(sokol PRIVATE src/sokol/gfx.cpp src/sokol/imgui.cpp)

target_compile_definitions(
  sokol
  PUBLIC
    SOKOL_IMGUI_NO_SOKOL_APP
    SOKOL_GLCORE33
    SOKOL_NO_DEPRECATED
    SOKOL_VALIDATE_NON_FATAL
)

target_link_libraries(sokol glad imgui spdlog)

install(
  TARGETS sokol
  LIBRARY
    DESTINATION lib/
    COMPONENT core
)
