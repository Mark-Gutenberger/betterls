#pragma once

#ifdef GHC_FILESYSTEM_VERSION
fs::u8arguments u8guard(argc, argv);
if (!u8guard.valid()) {
	std::cerr << "Invalid character encoding, UTF-8 based encoding needed.\n";
	exit(EXIT_FAILURE);
};
#endif
