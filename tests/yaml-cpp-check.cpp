/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
yaml-cpp-check.cpp (c) 2022
Desc: checks for the global installation of the yaml-cpp package
Created:  2022-05-10T14:24:20.310Z
Modified: 2022-05-11T00:43:55.108Z
*/

// using namespace std;
// #pragma once
#include <iostream>

namespace colorls_tests {
int CheckYamlCpp() {
#ifndef YAML_H_62B23520_7C8E_11DE_8A39_0800200C9A66
	std::cerr << "yaml-cpp not found" << std::endl;
	std::cout << "please run `yarn install` in the root of the project." << std::endl;
	return 1;
#define YAML_CPP_313245835251658748 false
#else
	std::cout << "found yaml-cpp" << std::endl;
	return 0;
#define YAML_CPP_313245835251658748 true
#endif
};
};	// namespace colorls_tests

int main(int argc, char** argv) {
	colorls_tests::CheckYamlCpp();
	return 0;
};
