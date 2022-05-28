#include "config.h"

// using namespace std;
// using namespace ryml;

std::string get_file_contents(const char* filename) {
	std::ifstream in(filename, std::ios::in | std::ios::binary);
	if (!in) {
		// std::cerr << "could not open " << filename << std::endl;
		fmt::print(stderr, "could not open {}.\n", filename);
		exit(1);
	};
	std::ostringstream contents;
	contents << in.rdbuf();
	return contents.str();
};

void load_colorls_config_file(const char* file) {
	std::string contents = get_file_contents(file);
	ryml::Tree tree = ryml::parse_in_arena(ryml::to_csubstr(contents));
	ryml::NodeRef foo = tree["foo"];
	for (ryml::NodeRef const& child : foo.children()) {
		// std::cout << "key: " << child.key() << " val: " << child.val() << std::endl;
		// fmt::print("key: {0} val: {1}\n", child.key(), child.val());
		fmt::print("hi mom\n");
	};
};
