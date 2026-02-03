cmake_minimum_required(VERSION 3.20)
project(monitor-off)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(monitor-off WIN32 main.cpp)

# UTF-8 ソースコード対応
if(MSVC)
    target_compile_options(monitor-off PRIVATE /utf-8)
endif()
