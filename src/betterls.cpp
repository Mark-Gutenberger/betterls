/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
betterls.cpp (c) 2022
Desc: main entry point for the program
Created:  2022-05-02T13:19:54.883Z
Modified: 2022-05-12T21:56:15.050Z
*/
// #include "./src/core.cpp"
#include "core.cpp"

int main(int argc, char** argv) {
	betterls::main ls;
	ls.ls(argc, argv);
};
