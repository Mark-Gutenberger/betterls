# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# install-deps.sh (c) 2022
# Desc: description
# Created:  2022-05-03T18:56:11.669Z
# Modified: 2022-05-04T21:38:37.302Z

cd lib
rm ./* -rf
curl -R -O https://www.lua.org/ftp/lua-5.4.4.tar.gz
tar -xf ./lua-5.4.4.tar.gz
curl -R https://codeload.github.com/fmtlib/fmt/tar.gz/refs/tags/8.1.1 -o ./fmt-8.1.1.tar.gz
tar -xf ./fmt-8.1.1.tar.gz
curl -R https://codeload.github.com/tronkko/dirent/tar.gz/refs/tags/1.23.2 -o ./dirent-1.23.2.tar.gz
tar -xf ./dirent-1.23.2.tar.gz
exit 0
