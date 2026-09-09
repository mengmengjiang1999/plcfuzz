#pragma once

#include <pthread.h>

#include <system_error>

class PthreadMutexGuard {
   public:
    explicit PthreadMutexGuard(pthread_mutex_t& mutex) : mutex_(mutex) {
        const int result = pthread_mutex_lock(&mutex_);
        if (result != 0) {
            throw std::system_error(result, std::generic_category(), "unable to acquire runtime buffer mutex");
        }
    }

    ~PthreadMutexGuard() { pthread_mutex_unlock(&mutex_); }

    PthreadMutexGuard(const PthreadMutexGuard&) = delete;
    PthreadMutexGuard& operator=(const PthreadMutexGuard&) = delete;

   private:
    pthread_mutex_t& mutex_;
};
