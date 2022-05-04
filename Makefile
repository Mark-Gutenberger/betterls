# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-04T18:40:06.007Z

SHELL = /bin/bash
SRC_DIR = ./src/
TARGET = colorls.cpp
VERSION = $(shell node ./scripts/version.js)
CXX = clang++
OUT_DIR = ./bin/
PLATFORM = $(shell echo ${OS})
CXXFLAGS =  -stdlib=libc++
LINKFLAGS = -lpthread
# CLANGFLAGS =

.PHONY: all compile clean windows

all:
	make clean
	@echo ""
	@echo "Version: $(VERSION)"
	@echo ""
	@echo "Semantic executable names use the following syntax:"
	@echo "  <app>-<platform>-<version>"
	@echo ""
	@echo ""
	make windows
	@echo "$(shell date)" >> $(OUT_DIR).last-compile

windows:
	$(CXX) $(CLANGFLAGS) -c ./colorls.cpp $(LINKFLAGS) -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).o $(CXXFLAGS)
	$(CXX) $(CLANGFLAGS) $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(LINKFLAGS) -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main.exe


clean:
	rm -rf ./bin/*
