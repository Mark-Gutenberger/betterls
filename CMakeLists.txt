cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

project (colorls LANGUAGES CXX VERSION 1.0.0)

cmake_policy(SET CMP0048 NEW)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

message("\nCMAKE_PROJECT_VERSION = ${CMAKE_PROJECT_VERSION}")
message("CMAKE_PROJECT_NAME = ${CMAKE_PROJECT_NAME}")
message("CMAKE_CXX_STANDARD = ${CMAKE_CXX_STANDARD}\n")

add_subdirectory(src)
# add_subdirectory(tests)
