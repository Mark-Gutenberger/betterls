// compile using: /std:c++latest
// deps
#include <argh/argh.h>
#include <betterls/betterls.hpp>
#include <betterls/colors.hpp>
#define FMT_HEADER_ONLY
#include <fmt/chrono.h>
#include <fmt/color.h>
#include <fmt/core.h>
// std
#include <chrono>
#include <ctime>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

namespace betterls {
std::string permToStr(std::filesystem::perms prms) {
	std::string result;

	result.reserve(9);
	for (int i = 0; i < 9; ++i) {
		result = ((static_cast<int>(prms) & (1 << i)) ? "xwrxwrxwr"[i] : '-') + result;
	};
	return result;
}

template <typename TP>

std::time_t to_time_t(TP tp) {
	// Based on trick from: Nico Josuttis, C++17 - The Complete Guide
	std::chrono::system_clock::duration dt =
		std::chrono::duration_cast<std::chrono::system_clock::duration>(tp - TP::clock::now());
	return std::chrono::system_clock::to_time_t(std::chrono::system_clock::now() + dt);
}  // time_t to_time_t

static std::filesystem::path dir{"."};	// initialized as char "." BUT READ THE REST OF THE CODE..

void parseParams(int argc, char* argv[]) {
	// pass through arguments in the order they are passed.
	for (int i = 0; i < argc; ++i) {
		auto arg = std::filesystem::u8path(argv[i]);
	};
}  // void parseParams

int main(int argc, char* argv[]) {
	parseParams(argc, argv);
	for (auto const& de : std::filesystem::directory_iterator(dir)) {
		auto fperms = (de.is_directory() ? "d" : "-") + permToStr(de.symlink_status().permissions()) + "  ";
		auto fsize = (de.is_directory() ? "<DIR>" : std::to_string(de.file_size())) + "  ";
		fsize = fmt::format("{:>{}}", fsize, 10);
		auto fname = de.path().filename().string() + "\n";
		auto ft = to_time_t(de.last_write_time());
		auto ftm = *std::localtime(&ft);
		auto ftime = fmt::format("{:%d-%m-%Y %H:%M:%S}", ftm);
		fmt::print("{}", fperms);
		fmt::print("{}", ftime);
		fmt::print("{}", fsize);
		if (de.is_symlink()) {
			fmt::print(fmt::fg(red), "{}", fname);
		} else if (de.is_directory()) {
			fmt::print(fmt::fg(blue), "{}", fname);
		} else if (de.is_regular_file()) {
			fmt::print(fmt::fg(lime), "{}", fname);
		} else {
			fmt::print("{}", fname);
		};
	};

	argh::parser cmdl;
	cmdl.parse(argc, argv, argh::parser::PREFER_PARAM_FOR_UNREG_OPTION);

	if (cmdl["-v"])
		std::cout << "Verbose, I am."
				  << "\n";

	// std::cout << "Positional args:\n";
	// for (auto& pos_arg : cmdl)
	// 	std::cout << '\t' << pos_arg << "\n";

	// std::cout << "Positional args:\n";
	// for (auto& pos_arg : cmdl.pos_args())
	// 	std::cout << '\t' << pos_arg << "\n";

	// std::cout << "\nFlags:\n";
	// for (auto& flag : cmdl.flags())
	// 	std::cout << '\t' << flag << "\n";

	return EXIT_SUCCESS;
}  // int main

}  // namespace betterls

// kinda gross, but bearable
int main(int argc, char* argv[]) {
	betterls::main(argc, argv);
}  // int main
