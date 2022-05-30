#include "config.h"

namespace betterls {
class yaml {
   private:
	std::string get_file_contents(const char* filename) {
		std::ifstream in(filename, std::ios::in | std::ios::binary);
		if (!in) {
			fmt::print(stderr, "could not open file `{}`.\n", filename);
			exit(EXIT_FAILURE);
		};
		std::ostringstream contents;
		contents << in.rdbuf();
		return contents.str();
	};

   public:
	void load_config_file(const char* file) {
		std::string contents = get_file_contents(file);
		ryml::Tree tree = ryml::parse_in_arena(ryml::to_csubstr(contents));
		ryml::NodeRef foo = tree["foo"];
		for (ryml::NodeRef const& child : foo.children()) {
			// std::string key = fmt::format("key: {} - ", child.key());
			// std::string val = fmt::format("val: {};", child.val());
			std::cout << "key: " << child.key() << " val: " << child.val() << std::endl;
			// fmt::print("key: {} - ", key);
			// fmt::print("val: {}\n", val);
			// fmt::print("hi mom\n");
		};
	};
};	// class yaml
};	// namespace betterls
