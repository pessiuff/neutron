#include "core/app.h"

using namespace neutron;

base_app* neutron_main() {
    return new playground::app();
}