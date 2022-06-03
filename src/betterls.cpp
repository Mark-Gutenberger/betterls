// compile using: /std:c++latest
#include "betterls.hpp"
#include "core.cpp"

int main(int argc, char* argv[]) {
	betterls::Core core{};
	core.ls(argc, argv);
};
