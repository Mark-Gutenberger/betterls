# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-03T14:17:07.441Z

SHELL = /bin/bash
TARGET = ./colorls.cpp
VERSION = $(shell node ./scripts/version.js)
CXX = clang++
OUT_DIR = ./bin/
PLATFORM = $(shell echo ${OS})

.PHONY: all compile clean

all:
	make clean
	@echo ""
	@echo "Version: $(VERSION)"
	@echo ""
	@echo "Semantic executable names use the following syntax:"
	@echo "  <app>-<platform>-<version>"
	@echo ""
	@echo ""
	mkdir -p $(OUT_DIR)
	make compile
	@echo "$(shell date)" >> $(OUT_DIR).last-compile

compile:
	# compile
	$(CXX) ./colorls.cpp -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe
	# write generic file
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe

clean:
	rm -rf ./bin/*
