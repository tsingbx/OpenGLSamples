cmake_minimum_required(VERSION 3.16...3.28 FATAL_ERROR)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake/modules")

project(Samples VERSION 1.0.0 LANGUAGES  C CXX)

include(AddExe)

# Workaround for the MS CRT deprecating parts of the standard library
if (MSVC OR CMAKE_C_SIMULATE_ID STREQUAL "MSVC")
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif()

if (WIN32)
    set(ICON glfw.rc)
elseif (APPLE)
    set(ICON glfw.icns)
endif()

set(GLAD_GL "${CMAKE_SOURCE_DIR}/deps/glad/gl.h")
#set(GLAD_GLES2 "${CMAKE_SOURCE_DIR}/deps/glad/gles2.h")
#set(GETOPT "${CMAKE_SOURCE_DIR}/deps/getopt.h"
#           "${CMAKE_SOURCE_DIR}/deps/getopt.c")
#set(TINYCTHREAD "${CMAKE_SOURCE_DIR}/deps/tinycthread.h"
#                "${CMAKE_SOURCE_DIR}/deps/tinycthread.c")

#--------------------------------------------------------------------
# Add subdirectories
#--------------------------------------------------------------------
add_subdirectory(glad)
add_subdirectory(HelloWindow)
add_subdirectory(Triangle)
add_subdirectory(Triangle2)
add_subdirectory(Triangle3)
add_subdirectory(Triangle4)
add_subdirectory(Rectangle)