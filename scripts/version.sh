#! /bin/bash
# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# prebuild.sh (c) 2022
# Desc: description
# Created:  2022-06-03T18:56:11.669Z
# Modified: 2022-05-06T14:15:28.371Z

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

echo $PACKAGE_VERSION