cmake_minimum_required(VERSION 4.2.0)

project(sokol)

set(sokol_headers
    include/sokol/sokol_app.h
    include/sokol/sokol_args.h
    include/sokol/sokol_audio.h
    include/sokol/sokol_fetch.h
    include/sokol/sokol_gfx.h
    include/sokol/sokol_glue.h
    include/sokol/sokol_log.h
    include/sokol/sokol_time.h
)

set(sokol_sources
    source/sokol.c
)

add_library(${PROJECT_NAME} STATIC ${sokol_headers})
target_include_directories(${PROJECT_NAME} PUBLIC include/)
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)