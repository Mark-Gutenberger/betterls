#! /bin/bash

vcpkg='../vcpkg/vcpkg'

printf "\e[33m\nruning from:\n  $(pwd)/\nmake sure you run from the root of the project.\n"
printf "comment out these lines in \e[0m./scripts/install-deps.sh\e[33m to silence this warning\n\n\e[0m"

printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing dirent-1.23.2...\n\n\e[0m"
$vcpkg install dirent

printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing rapidyaml...\n\n\e[0m"
$vcpkg install ryml

printf "\e[36m++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\e[0m"
printf "\e[35mINFO: installing termcolor-2.0.0...\n\n\e[0m"
$vcpkg install termcolor

printf "\e[32mSucess!\n\n\e[0m"
exit 0
