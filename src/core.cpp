/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.cpp (c) 2022
Desc: description
Created:  2022-05-03T19:04:08.189Z
Modified: 2022-05-04T21:54:37.625Z
*/

#include "core.h"
// using namespace std;

int listdir(const char* path) {
	struct dirent* entry;
	DIR* dp;

	dp = opendir(path);
	if (dp == NULL) {
		perror("opendir");
		return -1;
	}

	while ((entry = readdir(dp)))
		puts(entry->d_name);

	closedir(dp);
	return 0;
}
