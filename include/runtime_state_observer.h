#pragma once

#include "buffer_history.h"

class RuntimeStateObserver {
   public:
    void initialize();
    void observe();
    bool output_changed();

   private:
    BufferHistory history_;
};

RuntimeStateObserver& runtimeStateObserver();
