# Have to either call subdirectory if third-party already has a compatible
# CMakeLists.txt , otherwise create the target by-hand

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules)

add_subdirectory(micropather)
add_subdirectory(chaiscript)
add_subdirectory(glad)
add_subdirectory(imgui)
add_subdirectory(sokol)
add_subdirectory(fmod)
add_subdirectory(argparse)
add_subdirectory(tiny-process-library)

# box2d
option(BOX2D_BUILD_UNIT_TESTS "" OFF)
option(BOX2D_BUILD_TESTBED "" OFF)
option(BOX2D_BUILD_DOCS "" OFF)
option(BOX2D_USER_SETTINGS "" OFF)
option(BUILD_SHARED_LIBS "" ON)
add_subdirectory(box2d)

## entt
option(BUILD_TESTING "" OFF)
add_subdirectory(entt)

target_precompile_headers(
  EnTT
  INTERFACE
    entt/src/entt/entt.hpp
)

## glfw
set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "")
set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "")
set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "")
set(GLFW_INSTALL ON CACHE INTERNAL "")
set(BUILD_SHARED_LIBS "" ON)
add_subdirectory(glfw)
set(BUILD_SHARED_LIBS "" OFF)

## json
add_subdirectory(cjson)

## STB image
add_library(stb_image INTERFACE)
target_include_directories(stb_image INTERFACE stb/include)

## GLM
add_library(glm INTERFACE)
target_include_directories(
  glm
  INTERFACE
    glm/include
)
target_precompile_headers(
  glm
  INTERFACE
    glm/include/glm/glm.hpp
    glm/include/glm/ext/matrix_transform.hpp
)

## spdlog
set(SPDLOG_BUILD_SHARED ON CACHE INTERNAL "")
set(SPDLOG_ENABLE_PCH ON CACHE INTERNAL "")
set(SPDLOG_INSTALL ON CACHE INTERNAL "")
set(SPDLOG_FMT_EXTERNAL OFF CACHE INTERNAL "")
set(SPDLOG_FMT_EXTERNAL_HO OFF CACHE INTERNAL "")
add_subdirectory(spdlog)

## enet
add_library(enet STATIC)
target_include_directories(enet PUBLIC enet/include)
target_compile_definitions(enet PRIVATE HAS_SOCKLEN_T)
target_sources(
  enet
  PRIVATE
    enet/callbacks.c
    enet/compress.c
    enet/host.c
    enet/list.c
    enet/packet.c
    enet/peer.c
    enet/protocol.c
    enet/unix.c
    enet/win32.c
)

if (PULCHER_PLATFORM STREQUAL "Win64")
  target_link_libraries(enet PUBLIC winmm ws2_32)
endif()
