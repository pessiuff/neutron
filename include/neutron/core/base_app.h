#pragma once

#include <string>

namespace neutron {
    class base_app {
    public:
        base_app(const int& window_width, const int& window_height, const std::string& window_title);
        virtual ~base_app();

        virtual void init() = 0;
        virtual void frame() = 0;
        virtual void cleanup() = 0;

        [[nodiscard]] inline const int& get_window_width() const {
            return m_window_width;
        }

        [[nodiscard]] inline const int& get_window_height() const {
            return m_window_height;
        }

        [[nodiscard]] inline const std::string& get_window_title() const {
            return m_window_title;
        }

    protected:
        int m_window_width, m_window_height;
        std::string m_window_title;
    };
}