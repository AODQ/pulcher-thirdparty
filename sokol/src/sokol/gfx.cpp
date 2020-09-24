#define SOKOL_IMPL

#include <spdlog/spdlog.h>

#define SOKOL_LOG(msg) \
  spdlog::error("{}", msg);

#define SOKOL_ASSERT(c) \
  { \
    if (!(c)) { \
      spdlog::critical( \
        "sokol assertion failed; {}@{} {}", __FILE__, __LINE__, #c \
      ); \
      abort(); \
    } \
  }

#include <glad/glad.hpp>
#include <sokol/gfx.hpp>
