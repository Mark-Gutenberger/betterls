#include "core.h"

/*
 * List files and directories within a directory.
 */
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
					fmt::print("{}\n", ent->d_name);
					break;

				case DT_DIR:
					fmt::print("{}/\n", ent->d_name);
					break;

				case DT_LNK:
					fmt::print("{}@\n", ent->d_name);
					break;

				default:
					fmt::print("{}*\n", ent->d_name);
			};
		};

		closedir(dir);

	} else {
		/* Could not open directory */
		fmt::print("Cannot open directory {}\n", dirname);
		exit(EXIT_FAILURE);
	};
};

int colorls(int argc, char* argv[]) {
	// throw the version if no options are passed
	// TODO: add a flag to throw the version
	// if (argc < 2) {
	// 	// report version
	// 	std::cout << argv[0] << " Version " << colorls_VERSION_MAJOR << "." << colorls_VERSION_MINOR << "."
	// 			  << colorls_VERSION_PATCH << std::endl;
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

	load_colorls_config_file("/mom.yaml");

	return EXIT_SUCCESS;
};
