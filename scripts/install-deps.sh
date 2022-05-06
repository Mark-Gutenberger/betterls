# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# install-deps.sh (c) 2022
# Desc: description
# Created:  2022-05-03T18:56:11.669Z
# Modified: 2022-05-06T14:15:28.371Z

cd lib
rm ./* -rf
curl -R https://codeload.github.com/tronkko/dirent/tar.gz/refs/tags/1.23.2 -o ./dirent-1.23.2.tar.gz
tar -xf ./dirent-1.23.2.tar.gz
curl -R https://codeload.github.com/fmtlib/fmt/tar.gz/refs/tags/8.1.1 -o ./fmt-8.1.1.tar.gz
tar -xf ./fmt-8.1.1.tar.gz

read -p "install fmt natively?" -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]
	cd fmt-8.1.1
	mkdir build -p
	cmake .
	make all install
	exit 0
then
	exit 0
fi
