# Add all the source files needed to build the executable
add_executable(main ../colorls.cpp)
add_executable(colorls ../colorls.cpp)

configure_file(./version.h.in ./version.h)

# # Include the directory where MyLibrary project is. Otherwise, we can't use the
# # library
# add_subdirectory(libraries/MyLibrary)

# # Link the executable and the library together
# target_link_libraries(Project MyLibrary)

target_include_directories(colorls PUBLIC "${PROJECT_BINARY_DIR}")
