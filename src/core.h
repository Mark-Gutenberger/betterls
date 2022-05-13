/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.h (c) 2022
Desc: core.h
Created:  2022-05-12T21:46:10.896Z
Modified: 2022-05-12T21:52:13.877Z
*/

#pragma once

#include <stdio.h>
#include <iostream>

#ifdef _WIN32
#include "../lib/dirent-1.23.2/include/dirent.h"
#else
#include <dirent.h>
#endif
