#pragma once

#include <stdio.h>
#include <iostream>

#include "version.h"
#include "platform.h"

#ifdef _WIN32
#include "../include/dirent.h"
#else
#include <dirent.h>
#endif

#define FMT_HEADER_ONLY
// #include "../include/fmt/format.h"
#include "../include/fmt/core.h"
