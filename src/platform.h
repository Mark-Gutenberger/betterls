#ifndef PLATFORM

#if defined(_WIN32) || defined(_WIN64)
#define PLATFORM "Windows"
#define __PLATFORM__ 0
#endif

#if defined(__linux__) || defined(__ANDROID__) || defined(__APPLE__)
#define PLATFORM "Unix"
#define __PLATFORM__ 1
#endif

#endif	// PLATFORM
