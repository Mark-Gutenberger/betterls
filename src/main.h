/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.h (c) 2022
Desc: description
Created:  2022-05-03T19:06:37.869Z
Modified:2022-05-03T19:06:40.400Z
*/

// ONLY include globally called libraries
#pragma once

// #include <sys/types.h>
#include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
#include <iostream>
// #include <string>

#ifdef _WIN32
// #include <fcntl.h>
// #include <io.h>
#include "../lib/dirent-1.23.2/include/dirent.h"
#else
#include <dirent.h>
#endif

// #include "../lib/termcolor-2.0.0/termcolor.hpp"
