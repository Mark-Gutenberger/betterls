#! /bin/bash

. ./prebuild.sh # returns the OS

printf "\e[33m\nruning from:\n  $(pwd)/\nmake sure you run from the root of the project.\n"
printf "comment out these lines in \e[0m./scripts/install-deps.sh\e[33m to silence this warning\n\n\e[0m"

mkdir -p ./lib/
cd lib
rm ./* -rf
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing dirent-1.23.2...\n\n\e[0m"
curl -R https://codeload.github.com/tronkko/dirent/tar.gz/refs/tags/1.23.2 -o ./dirent-1.23.2.tar.gz
tar -xf ./dirent-1.23.2.tar.gz
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
# printf "\e[35mINFO: installing c4conf...\n\n\e[0m"
# curl -R https://codeload.github.com/biojppm/c4conf/tar.gz/refs/tags/v0.1.0 -o ./c4conf-0.1.0.tar.gz
# tar -xf ./c4conf-0.1.0.tar.gz
# printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing rapidyaml...\n\n\e[0m"
# curl -R https://codeload.github.com/biojppm/rapidyaml/tar.gz/refs/tags/v0.4.1 -o ./rapidyaml-0.4.1.tar.gz
# tar -xf ./rapidyaml-0.4.1.tar.gz
git clone --recursive https://github.com/biojppm/rapidyaml.git --depth 1 ./rapidyaml-0.4.1
cd ./rapidyaml-0.4.1/
cmake ./samples/singleheaderlib/CMakeLists.txt -G "Unix Makefiles"
cd ./samples/singleheaderlib/
make
cd ../../
cd ../
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing termcolor-2.0.0...\n\n\e[0m"
mkdir -p ./termcolor-2.0.0
cd ./termcolor-2.0.0
# yeah, i just mixed http clients, so what?
wget -RO https://raw.githubusercontent.com/ikalnytskyi/termcolor/master/include/termcolor/termcolor.hpp
printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: removing temp files...\n\n\e[0m"
cd ../
rm ./*.tar.gz
cd ../
rm -f yarn.lock
rm -f package-lock.json
rm -f yarn.log
rm -f yarn-error.log
rm -rf node_modules
printf "\e[32mSucess!\n\n\e[0m"
exit 0
