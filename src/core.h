#pragma once

#include <stdio.h>
#include <iostream>

#ifdef _WIN32
#include "../lib/dirent-1.23.2/include/dirent.h"
#else
#include <dirent.h>
#endif
