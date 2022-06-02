#include "core.h"
#include <cstdlib>
#include <string>

namespace fs = std::filesystem;
namespace betterls {
class main {
   public:
	static std::string perm_to_str(fs::perms prms) {
		std::string result;
		result.reserve(9);
		for (int i = 0; i < 9; ++i) {
			result = ((static_cast<int>(prms) & (1 << i)) ? "xwrxwrxwr"[i] : '-') + result;
		}
		return result;
	}

	//    public:
	// 	template <typename TP>
	// 	std::time_t to_time_t(TP tp) {
	// 		using namespace std::chrono;
	// 		auto sctp = time_point_cast<system_clock::duration>(tp - TP::clock::now() + system_clock::now());
	// 		return system_clock::to_time_t(sctp);
	// 	}
   public:
	template <typename TP>
	std::time_t to_time_t(TP tp) {
		// Based on trick from: Nico Josuttis, C++17 - The Complete Guide
		std::chrono::system_clock::duration dt =
			std::chrono::duration_cast<std::chrono::system_clock::duration>(tp - TP::clock::now());
		return std::chrono::system_clock::to_time_t(std::chrono::system_clock::now() + dt);
	}

	//    private:
	// 	inline static const auto print_last_write_time = [](std::filesystem::file_time_type const& ftime) {
	// 		std::time_t cftime = std::chrono::system_clock::to_time_t(std::chrono::file_clock::to_sys(ftime));
	// 		std::cout << "File write time is " << std::asctime(std::localtime(&cftime));
	// 	};

   public:
	int ls(int argc, char* argv[]) {
		fs::path dir{"."};
#ifdef GHC_FILESYSTEM_VERSION
		fs::u8arguments u8guard(argc, argv);
		if (!u8guard.valid()) {
			std::cerr << "Invalid character encoding, UTF-8 based encoding needed.\n";
			exit(EXIT_FAILURE);
		}
#endif
		if (argc > 2) {
			std::cerr << "you have somehow managed to break the program.\n";
			exit(EXIT_FAILURE);
		};
		if (argc == 2) {
			fmt::print("{}\n", argv[1]);
			dir = fs::u8path(argv[1]);
		};
		for (auto const& de : fs::directory_iterator(dir)) {
			auto fperms = (de.is_directory() ? "d" : "-") + perm_to_str(de.symlink_status().permissions()) + "  ";
			auto fsize = (de.is_directory() ? "<DIR>" : std::to_string(de.file_size())) + "  ";
			fsize = fmt::format("{:>{}}", fsize, 10);
			auto fname = de.path().filename().string() + "\n";
			auto ft = to_time_t(de.last_write_time());
			auto ftm = *std::localtime(&ft);
			// using namespace std::literals::chrono_literals;
			auto ftime = fmt::format("{:%d-%m-%Y %H:%M:%S}", ftm);
			std::cout << fperms;
			std::cout << ftime;
			std::cout << fsize;
			std::cout << fname;
		};
		return 0;
	};
};	// class main
};	// namespace betterls
