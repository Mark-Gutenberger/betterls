#include "yaml.h"

std::string get_file_contents(const char *filename)
{
    std::ifstream in(filename, std::ios::in | std::ios::binary);
    if (!in) {
        std::cerr << "could not open " << filename << std::endl;
        exit(1);
    }
    std::ostringstream contents;
    contents << in.rdbuf();
    return contents.str();
}

int main(int argc, char const *argv[])
{
    std::string contents = get_file_contents("config.yml");
    ryml::Tree tree = ryml::parse(ryml::to_csubstr(contents));
    ryml::NodeRef foo = tree["foo"];
    for (ryml::NodeRef const& child : foo.children()) {
        std::cout << "key: " << child.key() << " val: " << child.val() << std::endl;
    }
    return 0;
}
