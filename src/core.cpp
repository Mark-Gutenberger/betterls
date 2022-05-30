#include "core.h"
#include "config.cpp"

betterls::internal intern;

namespace betterls {
class main {
   private:
	static void list_directory(const char* dirname) {
		DIR* dir;
		struct dirent* ent;

		/* Open directory stream */
		dir = opendir(dirname);
		if (dir != NULL) {
			/* Print all files and directories within the directory */
			while ((ent = readdir(dir)) != NULL) {
				switch (ent->d_type) {
					case DT_REG:
						fmt::print(fmt::emphasis::bold | fg(fmt::color::red), "{}\n", ent->d_name);
						break;

					case DT_DIR:
						fmt::print(fmt::emphasis::bold | fg(fmt::color::red), "{}/\n", ent->d_name);
						break;

					case DT_LNK:
						fmt::print(fmt::emphasis::bold | fg(fmt::color::red), "{}@\n", ent->d_name);
						break;

					default:
						fmt::print(fmt::emphasis::bold | fg(fmt::color::red), "{}*\n", ent->d_name);
				};
			};

			closedir(dir);

		} else {
			/* Could not open directory */
			fmt::print(fmt::emphasis::bold | fg(fmt::color::red), "Cannot open directory {}\n", dirname);
			exit(EXIT_FAILURE);
		};
	};

	// entry point for the program
   public:
	int ls(int argc, char* argv[]) {
		fmt::print("Platform: {}\n", PLATFORM);

		if (__PLATFORM__ == 0) {
			intern.load_config_file("C:\\Users\\Mark-\\mom.yaml");
		} else if (__PLATFORM__ == 1) {
			intern.load_config_file("/mnt/c/Users/Mark-/mom.yaml");
		} else {
			fmt::print(stderr, "Error: {}\n", "Unknown platform");
			exit(EXIT_FAILURE);
		};

		// throw the version if no options are passed
		// TODO: add a flag to throw the version
		// if (argc < 2) {
		// 	// report version
		// 	std::cout << argv[0] << " Version " << betterls_VERSION_MAJOR << "." << betterls_VERSION_MINOR << "."
		// 			  << betterls_VERSION_PATCH << std::endl;
		// 	std::cout << "Usage: " << argv[0] << " number" << std::endl;
		// 	return 1;
		// }

		/* For each directory in command line */
		int i = 1;
		while (i < argc) {
			list_directory(argv[i]);
			i++;
		};

		/* List current working directory if no arguments on command line */
		if (argc == 1) {
			list_directory(".");
		};

		return EXIT_SUCCESS;
	};
};	// class main
};	// namespace betterls
