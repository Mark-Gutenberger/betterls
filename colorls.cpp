/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
colorls.cpp (c) 2022
Desc: main entry point for the program
Created:  2022-05-02T13:19:54.883Z
Modified: 2022-05-12T21:56:15.050Z
*/

// do not use any logic or preprocessing here.
// this file serves as an entry point for the program and thats all.

#include "./src/core.cpp"
#include "./src/version.h"

int main(int argc, char** argv) {
	if (argc < 2) {
		// report version
		std::cout << argv[0] << " Version " << colorls_VERSION_MAJOR << "." << colorls_VERSION_MINOR << std::endl;
		std::cout << "Usage: " << argv[0] << " number" << std::endl;
		return 1;
	}

	colorls(argc, argv);
};
