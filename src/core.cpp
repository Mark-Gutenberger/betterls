/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.cpp (c) 2022
Desc: description
Created:  2022-05-03T19:04:08.189Z
Modified: 2022-05-04T18:49:47.624Z
*/

#include "core.h"
// using namespace std;
namespace fs = std::filesystem;

bool is_symlink = fs::is_symlink(".");
