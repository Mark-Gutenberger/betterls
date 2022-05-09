#! /bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# install-deps.sh (c) 2022
# Desc: description
# Created:  2022-05-03T18:56:11.669Z
# Modified: 2022-05-09T19:52:47.023Z

mkdir -p ./lib/
cd lib
rm ./* -rf
curl -R https://codeload.github.com/tronkko/dirent/tar.gz/refs/tags/1.23.2 -o ./dirent-1.23.2.tar.gz
tar -xf ./dirent-1.23.2.tar.gz
curl -R https://codeload.github.com/jbeder/yaml-cpp/tar.gz/refs/tags/yaml-cpp-0.7.0 -o ./yaml-cpp-0.7.0.tar.gz
tar -xf ./yaml-cpp-0.7.0.tar.gz
mkdir -p ./termcolor-2.0.0
cd ./termcolor-2.0.0
# yeah, i just mixed http clients, so what?
wget -RO https://raw.githubusercontent.com/ikalnytskyi/termcolor/master/include/termcolor/termcolor.hpp
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
rm ./*.tar.gz
cd ../
rm -f yarn.lock
rm -f package-lock.json
rm -f yarn.log
rm -f yarn-error.log
rm -rf node_modules
exit 0
