/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.h (c) 2022
Desc: description
Created:  2022-05-03T19:06:37.869Z
Modified:2022-05-03T19:06:40.400Z
*/

#pragma once

#define _HAS_CXX17 1

// #include <stdio.h>
// #include <string.h>
// #include <stdlib.h>
#include <iostream>
#include <string>



// #ifdef __cplusplus
#ifdef _WIN32
    #include "../lib/dirent-1.23.2/include/dirent.h"
#else
    #include <dirent.h>
    #include <sys/types.h>
#endif
#include "../lib/fmt-8.1.1/include/fmt/core.h"
