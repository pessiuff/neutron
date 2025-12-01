if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_compile_definitions(${PROJECT_NAME} PUBLIC NEUTRON_PLATFORM_WINDOWS)
    if(MINGW)
        target_compile_options(${PROJECT_NAME} PRIVATE -mwin32)
        target_link_libraries(${PROJECT_NAME} PRIVATE kernel32 user32 shell32 dxgi d3d11)
    endif()
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_definitions(${PROJECT_NAME} PUBLIC NEUTRON_PLATFORM_LINUX)
    target_compile_options(${PROJECT_NAME} PRIVATE -pthread)
    target_link_options(${PROJECT_NAME} PRIVATE -pthread)
    target_link_libraries(${PROJECT_NAME} PRIVATE X11 Xi Xcursor dl pthread m GL)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    target_compile_definitions(${PROJECT_NAME} PUBLIC NEUTRON_PLATFORM_MACOS)
    target_link_libraries(${PROJECT_NAME} PRIVATE
        "-framework Foundation"
        "-framework Cocoa"
        "-framework QuartzCore"
        "-framework Metal"
        "-framework MetalKit"
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "iOS")
    target_compile_definitions(${PROJECT_NAME} PUBLIC NEUTRON_PLATFORM_IOS)
    target_link_libraries(${PROJECT_NAME} PRIVATE
        "-framework Foundation"
        "-framework UIKit"
        "-framework Metal"
        "-framework MetalKit"
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Android")
    target_compile_definitions(${PROJECT_NAME} PUBLIC NEUTRON_PLATFORM_ANDROID)
    target_link_libraries(${PROJECT_NAME} PRIVATE GLESv3 EGL log android)
endif()
