#pragma once

#include <iostream>
#include <string>

#include "../include/argh.h"

namespace betterls {
class Core {
   private:
	class Args {
	   public:
		bool verbose{};
		bool version{};
		bool help{};
		bool recursive{};
		bool follow_symlinks{};
		bool no_color{};
		bool no_sort{};
		bool all{};
		bool almost_all{};
	};

   public:
	Args args;
};
};	// namespace betterls
