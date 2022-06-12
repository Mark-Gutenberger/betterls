#pragma once

#ifndef BETTERLS_HPP
#define BETTERLS_HPP

#ifdef GHC_FILESYSTEM_VERSION
std::filesystem::u8arguments u8guard(argc, argv);
if (!u8guard.valid()) {
	std::cerr << "Invalid character encoding, UTF-8 based encoding needed.\n";
	exit(EXIT_FAILURE);
};
#endif	// GHC_FILESYSTEM_VERSION

#endif	// BETTERLS_HPP
