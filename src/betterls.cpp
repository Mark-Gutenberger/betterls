// compile using: /std:c++latest
#include "core.cpp"

int main(int argc, char* argv[]) {
	betterls::Core core{};
	core.ls(argc, argv);
	// for (int i = 0; i < color_n; i++) {
	// 	fmt::print(fmt::fg(red), "{}\n", cArr__[i]);
	// };
}
