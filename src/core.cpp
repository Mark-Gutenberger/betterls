/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
core.cpp (c) 2022
Desc: description
Created:  2022-05-03T19:04:08.189Z
Modified: 2022-05-10T14:39:24.515Z
*/

#include "main.h"
using namespace std;

int main(const char* path) {
	struct dirent* entry;
	DIR* dp;
	dp = opendir(path);
	if (dp == NULL) {
		ERROR_SET_NOT_FOUND("No files found in directory");
		return 1;
	}
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
