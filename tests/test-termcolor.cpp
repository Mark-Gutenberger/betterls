/*
SPDX-License-Identifier: MIT
Author: Mark Gutenberger <mark-gutenberger@outlook.com>
test-termcolor.cpp (c) 2022
Desc: automated tests for the termcolor library
Created:  2022-05-09T18:28:57.898Z
Modified: 2022-05-09T18:38:14.346Z
*/

#pragma once
#include <iostream>
#include "../lib/termcolor-2.0.0/termcolor.hpp"

int main(int /*argc*/, char** /*argv*/) {
	std::cout << termcolor::red << '16 bit red' << std::endl;				   // 16 colors
	std::cout << termcolor::color<100> << '256 bit yellow' << std::endl;	   // 256 colors
	std::cout << termcolor::color<211, 54, 130> << 'rgb purple' << std::endl;  // true colors
	std::cout << termcolor::reset << 'plain text' << std::endl;				   // reset
	return 0;
};
