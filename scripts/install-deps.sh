#! /bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# install-deps.sh (c) 2022
# Desc: description
# Created:  2022-05-03T18:56:11.669Z
# Modified: 2022-05-12T12:42:11.552Z

printf "\e[33m\nruning from:\n  $(pwd)/\nmake sure you run from the root of the project.\n"
printf "comment out these lines in \e[0m./scripts/install-deps.sh\e[33m to silence this warning\n\n\e[0m"
printf "\e[33mWARN: This process will take several minutes...\n\n\e[0m"

if ! vcpkg -v
then
	printf "\e[31mERROR: vcpkg is not installed.\n\n\e[0m"
	printf "You need vcpkg for this project.\n"
	printf "Another option is manually editing this file, changing the global command to where ever you have vcpkg installed.\n\n"
	exit 1
fi
mkdir -p ./lib/
cd lib
rm ./* -rf
printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
curl -R https://codeload.github.com/tronkko/dirent/tar.gz/refs/tags/1.23.2 -o ./dirent-1.23.2.tar.gz
tar -xf ./dirent-1.23.2.tar.gz
printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
curl -R https://codeload.github.com/jbeder/yaml-cpp/tar.gz/refs/tags/yaml-cpp-0.7.0 -o ./yaml-cpp-0.7.0.tar.gz
tar -xf ./yaml-cpp-0.7.0.tar.gz
printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
cd ./yaml-cpp-yaml-cpp-0.7.0
# TODO: impliment C++ test to check if we need to do a glob install instead of doing it every time anyway
mkdir -p ./build
cd ./build
cmake ../ -DYAML_BUILD_SHARED_LIBS=on
make
make install
cd ../../
# TODO: ENDTODO
mkdir -p ./termcolor-2.0.0
cd ./termcolor-2.0.0
printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
# yeah, i just mixed http clients, so what?
wget -RO https://raw.githubusercontent.com/ikalnytskyi/termcolor/master/include/termcolor/termcolor.hpp
printf "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
cd ../
# function convert_to_LF() {
# 	cd ../
# 	dos2unix ./*
# 	dos2unix ./**/*
# 	dos2unix ./**/**/*
# 	dos2unix ./**/**/**/*
# 	dos2unix ./**/**/**/**/*
# }
# convert_to_LF
pwd
rm ./*.tar.gz
cd ../
rm -f yarn.lock
rm -f package-lock.json
rm -f yarn.log
rm -f yarn-error.log
rm -rf node_modules
exit 0
