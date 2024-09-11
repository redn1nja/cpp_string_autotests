cmake_minimum_required(VERSION 3.0)

# CHANGE YOUR PROJECT NAME
set(PROJECT_NAME string_tests)
set(CMAKE_CXX_STANDARD 20)

project(${PROJECT_NAME} C CXX)

set(LIBN my_string)
#set(CMAKE_C_STANDARD 11)

if (NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Release)
endif ()

#####################################################################################################
# 1) set up gtests. This block of code is taken from https://crascit.com/2015/07/25/cmake-gtest/
# Download and unpack googletest at configure time
include(FetchContent)
FetchContent_Declare(
		googletest
		URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
FetchContent_MakeAvailable(googletest)


#####################################################################################################

# 2) build my_str library
add_library(
        ${LIBN} SHARED
        ${CMAKE_SOURCE_DIR}/mystring.cpp
)
target_include_directories(${LIBN} PUBLIC ${CMAKE_SOURCE_DIR})

#####################################################################################################
# 3) build tests
add_executable(gtester ${CMAKE_SOURCE_DIR}/google_tests/main.cpp ${CMAKE_SOURCE_DIR}/google_tests/Tests/tests.cpp)
target_compile_definitions(gtester PUBLIC FILE_DIR="${CMAKE_SOURCE_DIR}/google_tests/test_files")
target_link_libraries(gtester ${LIBN} gtest gtest_main)

###################################
# set output directory (bin)
set_target_properties(${LIBN} gtester
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set_target_properties(${LIBN}
        PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib_bin
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib_bin)

