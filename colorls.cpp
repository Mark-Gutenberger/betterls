/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
colorls.cpp (c) 2022
Desc: main entry point for the program
Created:  2022-05-02T13:19:54.883Z
Modified: 2022-05-04T21:54:52.658Z
*/

#include "./src/core.cpp"
using namespace std;

int main(int argc, char** argv) {
	int counter = 1;

	if (argc == 1)
		listdir(".");

	while (++counter <= argc) {
		printf("\nListing %s...\n", argv[counter - 1]);
		listdir(argv[counter - 1]);
	}
};
