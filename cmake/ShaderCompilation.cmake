if(CMAKE_HOST_WIN32)
    set(SOKOL_SHDC_FILENAME "sokol-shdc-windows.exe")
elseif(CMAKE_HOST_APPLE)
    set(SOKOL_SHDC_FILENAME "sokol-shdc-macos")
elseif(CMAKE_HOST_UNIX)
    set(SOKOL_SHDC_FILENAME "sokol-shdc-linux")
endif()

find_program(SOKOL_SHDC_EXE
    NAMES ${SOKOL_SHDC_FILENAME}
    PATHS "${CMAKE_SOURCE_DIR}/deps/sokol/tools"
    NO_DEFAULT_PATH
    REQUIRED
)

function(neutron_add_shader target_name shader_list)
    foreach(shader_source ${shader_list})
        get_filename_component(shader_absolute "${shader_source}" ABSOLUTE)
        get_filename_component(shader_name "${shader_source}" NAME_WE)

        set(header_output "${CMAKE_CURRENT_BINARY_DIR}/shaders/${shader_name}.h")
        set(SLANG "hlsl5:glsl430:metal_macos:metal_ios:metal_sim:glsl310es")

        add_custom_command(
            OUTPUT ${header_output}
            COMMAND ${SOKOL_SHDC_EXE} --input ${shader_absolute} --output ${header_output} --slang ${SLANG}
            DEPENDS ${shader_absolute}
            COMMENT "Compiling shader: ${shader_name}"
        )

        target_sources(${target_name} PRIVATE ${header_output})
        target_include_directories(${target_name} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")
    endforeach()
endfunction()
