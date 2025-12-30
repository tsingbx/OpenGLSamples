cmake_minimum_required(VERSION 3.16...3.28 FATAL_ERROR)

add_library(glad glad.cpp)

target_link_libraries(glad PUBLIC glfw)

target_link_directories(glad PUBLIC /opt/homebrew/lib/)

target_include_directories(glad PUBLIC /opt/homebrew/include/ /usr/local/include/)