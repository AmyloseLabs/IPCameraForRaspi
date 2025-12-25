################################################################################
### @file : CMakeLists.txt
### @author : Amylose <dongjun.kim@minfinity.com>
### @date : 2023-06-30
### @version : 0.1.0
################################################################################

cmake_minimum_required(VERSION 3.5.0)
set(CMAKE_VERBOSE_MAKEFILE ON)


################################################################################
### SECTION : Cross complie options 
################################################################################
if (WIN32)
    set (ROOT_DRV_PATH D:)
    set (CMAKE_TOOLCHAIN_FILE_NAME win32-aarch64_raspi5.cmake)
    set (CMAKE_SYSTEM_OS_NAME "Windows")
else()
    set (ROOT_DRV_PATH /media/amylose/4A427D27427D18C1)
    set (CMAKE_TOOLCHAIN_FILE_NAME win32-aarch64_raspi5.cmake)
    set (CMAKE_SYSTEM_OS_NAME "Linux")
endif()

set (CMAKE_TOOLCHAIN_FILE ${ROOT_DRV_PATH}/sysroot/toolchain/cmake/${CMAKE_TOOLCHAIN_FILE_NAME})
set (PATH_SYSROOT ${ROOT_DRV_PATH}/sysroot/raspi5)

################################################################################
### SECTION : Set Project name
################################################################################
# project(UGBN_GNS_APP VERSION 0.1.0 LANGUAGES C CXX)
project(IPCameraForRaspi VERSION 0.1.0)


################################################################################
### SECTION : Display compile environment
################################################################################
message("************************************************************************************************************")
message("*** PROJECT_NAME: ${PROJECT_NAME}, CMAKE_PROJECT_VERSION: ${CMAKE_PROJECT_VERSION} ***")
message("    >> Host   System : ${CMAKE_HOST_SYSTEM_PROCESSOR}")
message("    >> Target System : ${CMAKE_SYSTEM_PROCESSOR}")
message("    >> OS Environment: ${CMAKE_SYSTEM_OS_NAME}")

################################################################################
### SECTION : Set Directory for linking if environment is cross complile that
################################################################################
if (CMAKE_TOOLCHAIN_FILE)
    message("    >> Toolchain detected.. Apply Toolchain file : ${CMAKE_TOOLCHAIN_FILE}")

    # Defines common include directory
    include_directories(
        ${PATH_SYSROOT}/usr/include
        ${PATH_SYSROOT}/usr/include/aarch64-linux-gnu
    )
    # include_directories(${PATH_SYSROOT}/usr/local/include)

    # Defines common linking library
    link_directories(
        ${PATH_SYSROOT}/lib
        ${PATH_SYSROOT}/lib/aarch64-linux-gnu
        ${PATH_SYSROOT}/usr/lib
        ${PATH_SYSROOT}/usr/lib/aarch64-linux-gnu
        ${PATH_SYSROOT}/usr/lib/aarch64-linux-gnu/libfakeroot
        ${PATH_SYSROOT}/usr/local/lib
    )

else()
    message("    >> Native Build Session..")
    set(PATH_SYSROOT)
endif()


################################################################################
### SECTION : build configs(generic)
################################################################################
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(THREADS_PREFER_PTHREAD_FLAG ON)
set(CMAKE_BUILD_TYPE Debug)
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_compile_options(-O0 -g)
endif()

message("    >> BUILD TYPE       : ${CMAKE_BUILD_TYPE}")

################################################################################
###    SECTION : Final Output Binary File Name
################################################################################
set(EXEC_FILE_NAME IpCamApp)

################################################################################
### SECTION : Add Libraries (Example)
################################################################################
# include_directories(${PATH_LIBS}/include)
# link_directories(${PATH_LIBS})
# set (LIBS
#     LIBS_LIST)

# or
# find_library(LIBS_NAMES NAMES libNAMES.so)

################################################################################
### SECTION : Add Library (Thread)
################################################################################
# find_package(Threads REQUIRED)
# message("  [PASS] Thread LIBS : ${CMAKE_THREAD_LIBS_INIT}")

################################################################################
### SECTION : Add Library (Gpio)
################################################################################
# set (LIBS_GPIOD gpiodcxx)
# message("  [PASS] GPIO LIBS: ${LIBS_GPIOD}")

################################################################################
### SECTION : Add Library (libiio)
################################################################################
# set (LIBS_IIO iio)
# message("  [PASS] LIB IIO : ${LIBS_IIO}")

################################################################################
### SECTION : Add Library (libad9361)
################################################################################
# set(LIBS_AD9361 ad9361)
# message("  [PASS] LIB AD9361 : ${LIBS_AD9361}")

################################################################################
### SECTION : Add Library (libconfig)
################################################################################
# set (LIBS_CONFIG config)
# message("  [PASS] Thread CONFIG : ${LIBS_CONFIG}")
################################################################################
### SECTION : Define Symbols
################################################################################
# add_definitions(-DDEFINE_SYMBOL)



################################################################################
### SECTION : Add Include paths
################################################################################
include_directories(
    src/
    # src/peripheral
    # src/common
    # src/ServiceTask
    # src/structures
    # src/ICD
)
################################################################################
### SECTION : Compile Executable with source code
################################################################################
add_executable(${EXEC_FILE_NAME}
    src/main.cpp
)

################################################################################
### SECTION : Link Executable
################################################################################
# target_link_libraries(${EXEC_FILE_NAME}
#     ${CMAKE_THREAD_LIBS_INIT}
#     ${LIBS_GPIOD}
#     ${LIBS_IIO}
#     ${LIBS_AD9361}
#     ${LIBS_CONFIG}
# )

################################################################################
### SECTION : Post Process after build
################################################################################
# add_custom_command(TARGET ${EXEC_FILE_NAME} POST_BUILD
#     COMMAND ${PROJECT_SOURCE_DIR}/UploadBinary_mspm.cmd
# )


################################################################################
### SECTION : Config End
################################################################################
message("************************************************************************************************************")

