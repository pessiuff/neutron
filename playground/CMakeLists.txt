cmake_minimum_required(VERSION 4.2.0)

project(neutron_playground)

set(neutron_playground_headers
    source/core/app.h
)

set(neutron_playground_sources
    source/main.cpp
    source/core/app.cpp
)

add_executable(${PROJECT_NAME} ${neutron_playground_headers} ${neutron_playground_sources})
target_include_directories(${PROJECT_NAME} PRIVATE source/)
target_link_libraries(${PROJECT_NAME} PRIVATE neutron)
