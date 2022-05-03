# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-03T12:38:08.532Z

SHELL = /bin/bash
TARGET = './colorls.cpp'
VERSION = $(shell git describe --tags --abbrev=0)
CXX = clang++
OUT_DIR = './bin/'

.PHONY: all win linux

all:
	@echo ""
	@echo "Version: $(VERSION)"
	@echo ""
	@echo "Semantic executable names use the following syntax:"
	@echo "  <app>-<platform>-<version>"
	@echo ""
	@echo ""
	# exit 1
	make win
	make linux

win:
	# compile
	$(CXX) ./colorls.cpp -o $(OUT_DIR)colorls-win-$(VERSION).exe
	# write generic file
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe

linux:
	exit 1

clean:
	rm -rf ./bin/*
