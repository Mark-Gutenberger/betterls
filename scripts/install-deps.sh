#! /bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# install-deps.sh (c) 2022
# Desc: description
# Created:  2022-05-03T18:56:11.669Z
# Modified: 2022-05-12T15:48:03.567Z

printf "\e[33m\nruning from:\n  $(pwd)/\nmake sure you run from the root of the project.\n"
printf "comment out these lines in \e[0m./scripts/install-deps.sh\e[33m to silence this warning\n\n\e[0m"

mkdir -p ./lib/
cd lib
rm ./* -rf
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing dirent-1.23.2\n\n\e[0m"
curl -R https://codeload.github.com/tronkko/dirent/tar.gz/refs/tags/1.23.2 -o ./dirent-1.23.2.tar.gz
tar -xf ./dirent-1.23.2.tar.gz
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing libyaml-0.2.5\n\n\e[0m"
curl -R https://codeload.github.com/yaml/libyaml/tar.gz/refs/tags/0.2.5 -o ./libyaml-0.2.5.tar.gz
tar -xf ./libyaml-0.2.5.tar.gz
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing termcolor-2.0.0\n\n\e[0m"
mkdir -p ./termcolor-2.0.0
cd ./termcolor-2.0.0
# yeah, i just mixed http clients, so what?
wget -RO https://raw.githubusercontent.com/ikalnytskyi/termcolor/master/include/termcolor/termcolor.hpp
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: removing temp files\n\n\e[0m"
cd ../
rm ./*.tar.gz
cd ../
rm -f yarn.lock
rm -f package-lock.json
rm -f yarn.log
rm -f yarn-error.log
rm -rf node_modules
exit 0
