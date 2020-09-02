# Have to either call subdirectory if third-party already has a compatible
# CMakeLists.txt , otherwise create the target by-hand

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules)

add_subdirectory(glad)
add_subdirectory(imgui)

## glfw
set(GLFW_BUILD_TESTS OFF CACHE INTERNAL "")
set(GLFW_BUILD_EXAMPLES OFF CACHE INTERNAL "")
set(GLFW_BUILD_DOCS OFF CACHE INTERNAL "")
set(GLFW_INSTALL OFF CACHE INTERNAL "")
add_subdirectory(glfw)

## json
set(JSON_BuildTests OFF CACHE INTERNAL "")
set(JSON_Install OFF CACHE INTERNAL "")
add_subdirectory(json)

## STB
add_library(stb INTERFACE)
target_include_directories(stb INTERFACE stb/include)

## cxxopts
add_library(cxxopts INTERFACE)
target_include_directories(cxxopts INTERFACE cxxopts/include)

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
elseif (PULCHER_PLATFORM STREQUAL "Linux")
  target_link_libraries(enet)
endif()
