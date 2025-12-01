#include "neutron/core/base_app.h"

using namespace neutron;

base_app::base_app(
    const int& window_width,
    const int& window_height,
    const std::string& window_title
) : m_window_width(window_width),
    m_window_height(window_height),
    m_window_title(window_title) {
        
}

base_app::~base_app() {

}