cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

set(CMAKE_DISABLE_SOURCE_CHANGES ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flags" CACHE STRING "Set C++ Compiler Flags" FORCE)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

project(betterls LANGUAGES CXX VERSION 1.0.0)

# Set a default build type if none was specified
# if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
#   message("Setting build type to 'RelWithDebInfo' as none was specified.")
#   set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
#   # Set the possible values of build type for cmake-gui
#   set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
#     "MinSizeRel" "RelWithDebInfo")
# endif()


set(CMAKE_CXX_STANDARD_REQUIRED True)

message(STATUS "\nCMAKE_PROJECT_VERSION = ${CMAKE_PROJECT_VERSION}")
message(STATUS "CMAKE_PROJECT_NAME = ${CMAKE_PROJECT_NAME}")
message(STATUS "CMAKE_GENERATOR = ${CMAKE_GENERATOR}")
message(STATUS "CMAKE_CXX_COMPILER = ${CMAKE_CXX_COMPILER}")
message(STATUS "CMAKE_CXX_STANDARD = ${CMAKE_CXX_STANDARD}\n")

# Add all the source files needed to build the executable
configure_file(./src/version.h.in ./src/version.h)
add_executable(betterls ./src/betterls.cpp)


# # Include the directory where MyLibrary project is. Otherwise, we can't use the
# # library
# add_subdirectory(libraries/MyLibrary)

# # Link the executable and the library together
# target_link_libraries(Project MyLibrary)

target_include_directories(betterls PUBLIC "${PROJECT_BINARY_DIR}")
