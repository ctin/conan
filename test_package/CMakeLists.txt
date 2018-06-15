PROJECT(MyHello)
cmake_minimum_required(VERSION 2.8)
enable_testing()

set(Boost_DEBUG 1)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)

if(CONAN_SETTINGS_OS STREQUAL "Android")
    set(CONAN_LIBCXX "") # NDK fails when specified: https://github.com/android-ndk/ndk/issues/541
endif()

CONAN_BASIC_SETUP()

IF(NOT HEADER_ONLY)

    include_directories(${Boost_INCLUDE_DIRS})
    ADD_EXECUTABLE(test test.cpp)
    MESSAGE("LIBS=> ${CONAN_LIBS}")
    TARGET_LINK_LIBRARIES(test ${CONAN_LIBS})
    message(STATUS "!!!!!!!!!!" "WITH_PYTHON" ${WITH_PYTHON})
    if(WITH_PYTHON)
        add_library(hello_ext SHARED python.cpp)
        if(WIN32)
            set_target_properties(hello_ext PROPERTIES SUFFIX ".pyd")
            target_include_directories(hello_ext PRIVATE C:/Python27/include)
            target_link_libraries(hello_ext C:/Python27/libs/python27.lib ${CONAN_LIBS})
        endif()
    endif()
ENDIF()
