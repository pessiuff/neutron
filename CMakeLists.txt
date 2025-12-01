cmake_minimum_required(VERSION 4.2.0)

project(neutron)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_compile_definitions(
    $<$<PLATFORM_ID:Windows>:BUILDO_PLATFORM_WINDOWS>
    $<$<PLATFORM_ID:Linux>:BUILDO_PLATFORM_LINUX>
    $<$<PLATFORM_ID:Darwin>:BUILDO_PLATFORM_MACOS>
    $<$<PLATFORM_ID:iOS>:BUILDO_PLATFORM_IOS>
    $<$<PLATFORM_ID:Android>:BUILDO_PLATFORM_ANDROID>
)

add_subdirectory(deps)

set(neutron_headers
    include/neutron/core/base_app.h
)

set(neutron_sources
    source/core/entry_point.cpp
    source/core/base_app.cpp
)

add_library(${PROJECT_NAME} STATIC ${neutron_headers} ${neutron_sources})
target_include_directories(${PROJECT_NAME} PUBLIC include/)
target_link_libraries(${PROJECT_NAME} PUBLIC sokol sigslot)

include(cmake/PlatformConfig.cmake)
include(cmake/ShaderCompilation.cmake)

add_subdirectory(examples)
add_subdirectory(playground)
