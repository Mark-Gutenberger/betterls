find_package(ryml CONFIG REQUIRED)
target_link_libraries(main PRIVATE ryml::ryml)
find_path(DIRENT_INCLUDE_DIRS "dirent.h")
target_include_directories(main PRIVATE ${DIRENT_INCLUDE_DIRS})
find_package(termcolor CONFIG REQUIRED)
target_link_libraries(main PRIVATE termcolor::termcolor)

# The extension is already found. Any number of sources could be listed here.
add_library (yamlParser yaml.cpp)

# Make sure the compiler can find include files for our Hello library
# when other libraries or executables link to Hello
target_include_directories (yamlParser PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
# "demo.cxx" and "demo_b.cxx". The extensions are automatically found.
add_executable (colorls ../colorls.cpp)

# Link the executable to the Hello library. Since the Hello library has
# public include directories we will use those link directories when building
# helloDemo
target_link_libraries (colorls LINK_PUBLIC yamlParser)
