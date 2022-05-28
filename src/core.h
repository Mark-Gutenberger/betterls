#pragma once

#include "config.cpp"

#include <stdio.h>
#include <iostream>

#include "version.h"

#ifdef _WIN32
#include "../include/dirent.h"
#else
#include <dirent.h>
#endif

#define FMT_HEADER_ONLY
// #include "../include/fmt/format.h"
#include "../include/fmt/core.h"
