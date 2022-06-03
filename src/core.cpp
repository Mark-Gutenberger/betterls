#include "core.hpp"
#include "colors.hpp"

#include <cstdlib>
#include <exception>
#include <iostream>
#include <string>

#include "../include/argh.h"

namespace chrono = std::chrono;
// #if __cplusplus >= 201703
#include <filesystem>
namespace fs = std::filesystem;
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
		int length;
	};

   public:
	Params params;

   private:
	std::string perm_to_str(fs::perms prms) {
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
		chrono::system_clock::duration dt =
			chrono::duration_cast<chrono::system_clock::duration>(tp - TP::clock::now());
		return chrono::system_clock::to_time_t(chrono::system_clock::now() + dt);
	};

   public:
	fs::path dir{"."};

   public:
	void is_arg_or_path(int argc, char* argv[]) {
		for (int i = 0; i < argc; ++i) {
			auto arg = fs::u8path(argv[i]);
			try {
				fs::is_directory(arg);
			} catch (std::exception& e) {
				std::cout << "hi mom (error....)\n";
				std::cout << e.what();
			};
			params.length = i;
		};
		dir = argv[1];
	};

   public:
	int ls(int argc, char* argv[]) {
		is_arg_or_path(argc, argv);
		for (auto const& de : fs::directory_iterator(dir)) {
			auto fperms = (de.is_directory() ? "d" : "-") + perm_to_str(de.symlink_status().permissions()) + "  ";
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

			fs::remove_all(dir);
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

		// std::cout << "\nParameters:\n";
		// for (auto& param : cmdl.params())
		// 	std::cout << '\t' << param.first << " : " << param.second << "\n";

		// std::cout << "\nparams.length: " << params.length;
		return EXIT_SUCCESS;
	};
};	// class main
};	// namespace betterls
