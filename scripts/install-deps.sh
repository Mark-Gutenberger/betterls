#! /bin/bash
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
curl -R https://codeload.github.com/s9w/oof/tar.gz/refs/tags/second -o ./oof-2.0.0.tar.gz
tar -xf ./oof-2.0.0.tar.gz
exit 0