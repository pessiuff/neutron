#pragma once

#include <neutron/core/base_app.h>

namespace neutron::playground {
    class app : public base_app {
    public:
        app();
        ~app();

        void init() override;
        void frame() override;
        void cleanup() override;
    };
}