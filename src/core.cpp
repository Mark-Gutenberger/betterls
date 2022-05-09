/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.cpp (c) 2022
Desc: description
Created:  2022-05-03T19:04:08.189Z
Modified: 2022-05-09T18:51:34.411Z
*/

#include "main.h"
using namespace std;

int listdir(const char* path) {
	struct dirent* entry;
	DIR* dp;
	dp = opendir(path);

	try {
		while ((entry = readdir(dp)))
			puts(entry->d_name);
		closedir(dp);

		return 0;

	} catch (const char* err) {
		cerr << err << endl;

		return 1;
	};
};
