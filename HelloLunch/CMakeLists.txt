cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(HelloLunch)
 
include(CheckCXXCompilerFlag)
include(CheckCXXSourceCompiles)
include(CheckIncludeFile)
include(CheckIncludeFiles)
include(CheckTypeSize)
 
find_package(CopperSpice REQUIRED)
 
set(PACKAGE "HelloLunch")
set(PACKAGE_NAME "HelloLunch")
 
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_INCLUDE_DIRECTORIES_BEFORE ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
 
# location for building binary files
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
 
add_subdirectory(src)