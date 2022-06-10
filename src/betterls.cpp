// compile using: /std:c++latest

#define FMT_HEADER_ONLY
#include <fmt/chrono.h>
#include <fmt/color.h>
#include <fmt/core.h>
#include <fmt/format.h>
#include <betterls/betterls.hpp>
#include <betterls/colors.hpp>
#include "core.cpp"

int main(int argc, char* argv[]) {
	betterls::Core core{};
	core.ls(argc, argv);
	// for (int i = 0; i < color_n; i++) {
	// 	fmt::print(fmt::fg(red), "{}\n", cArr__[i]);
	// };
};
