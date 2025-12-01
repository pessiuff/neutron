#include "core/app.h"

using namespace neutron;

void* neutron_main() {
    return new playground::app();
}