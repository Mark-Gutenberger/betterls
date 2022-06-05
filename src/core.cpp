#include "core.hpp"
#include "colors.hpp"

#include <cstdlib>
#include <exception>
#include <iostream>
#include <string>

#include <argh/argh.h>

// #if __cplusplus >= 201703
#include <filesystem>
// #else
// #pragma message(">=C++17 is required.\ncontinue at your own sanity...")

// #include <experimental/filesystem>
// namespace fs = std::experimental::filesystem;
// #endif

namespace betterls {
class Core {
   private:
	class Params {
	   public:
		std::string path{};
		int length{};
		bool hasPath{false};
		bool callVerbose{};
		bool callVersion{};
		bool callHelp{};
		bool callRecursive{};
		bool callNoColor{};
		bool callNoSort{};
		bool callAll{};
		bool callAlmost_all{};
		std::vector<std::string> flags{};
		// char* c = new char[length]();
	};

   public:
	Params params{};

   private:
	std::string permToStr(std::filesystem::perms prms) {
		std::string result;

		result.reserve(9);
		for (int i = 0; i < 9; ++i) {
			result = ((static_cast<int>(prms) & (1 << i)) ? "xwrxwrxwr"[i] : '-') + result;
		};
		return result;
	};

   private:
	template <typename TP>
	std::time_t to_time_t(TP tp) {
		// Based on trick from: Nico Josuttis, C++17 - The Complete Guide
		std::chrono::system_clock::duration dt =
			std::chrono::duration_cast<std::chrono::system_clock::duration>(tp - TP::clock::now());
		return std::chrono::system_clock::to_time_t(std::chrono::system_clock::now() + dt);
	};

   public:
	std::filesystem::path dir{"."};	 // initialized as char "." BUT READ THE REST OF THE CODE..

   private:
	void parseParams(int argc, char* argv[]) {
		// pass through arguments in the order they are passed.
		for (int i = 0; i < argc; ++i) {
			auto arg = std::filesystem::u8path(argv[i]);
			if (std::filesystem::is_directory(arg)) {
				dir = arg;
				params.hasPath = true;
				params.path = arg.string();
			};
			if (!params.hasPath) {
				params.path = std::filesystem::current_path().string();
				dir = std::filesystem::current_path();
			};
			params.length = i;
		};
	};

   public:
	int ls(int argc, char* argv[]) {
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
				fmt::print(fg(fmt::color::red), "{}", fname);
			} else if (de.is_directory()) {
				fmt::print(fg(fmt::color::blue), "{}", fname);
			} else if (de.is_regular_file()) {
				fmt::print(fg(fmt::color::green), "{}", fname);
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
	};
};	// class main
};	// namespace betterls
