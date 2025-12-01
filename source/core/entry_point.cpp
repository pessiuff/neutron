#define SOKOL_IMPL
#if defined(BUILDO_PLATFORM_WINDOWS)
#define SOKOL_D3D11
#elif defined(BUILDO_PLATFORM_LINUX)
#define SOKOL_GLCORE
#elif defined(BUILDO_PLATFORM_MACOS) || defined(BUILDO_PLATFORM_IOS)
#define SOKOL_METAL
#elif defined(BUILDO_PLATFORM_ANDROID)
#define SOKOL_GLES3
#else
#error Unsupported platform!
#endif

#include "neutron/core/entry_point.h"
#include "neutron/core/base_app.h"

#include <sokol/sokol_log.h>
#include <sokol/sokol_app.h>
#include <sokol/sokol_gfx.h>
#include <sokol/sokol_glue.h>

using namespace neutron;

static void init_userdata_cb(void* user_data) {
    sg_desc desc = {};
    desc.logger.func = slog_func;
    desc.environment = sglue_environment();
    sg_setup(desc);

    auto* app = static_cast<base_app*>(user_data);
    app->init();
}

static void frame_userdata_cb(void* user_data) {
    auto* app = static_cast<base_app*>(user_data);
    app->frame();
}

static void cleanup_userdata_cb(void* user_data) {
    auto* app = static_cast<base_app*>(user_data);
    app->cleanup();
    delete app;

    sg_shutdown();
}

static void event_userdata_cb(const sapp_event* event, void* user_data) {
    
}

sapp_desc sokol_main(int argc, char** argv) {
    base_app* app = static_cast<base_app*>(neutron_main());

    sapp_desc app_desc = {};
    app_desc.user_data = app;
    app_desc.init_userdata_cb = init_userdata_cb;
    app_desc.frame_userdata_cb = frame_userdata_cb;
    app_desc.cleanup_userdata_cb = cleanup_userdata_cb;
    app_desc.event_userdata_cb = event_userdata_cb;
    app_desc.width = app->get_window_width();
    app_desc.height = app->get_window_height();
    app_desc.window_title = app->get_window_title().c_str();
    app_desc.logger.func = slog_func;
    return app_desc;
}