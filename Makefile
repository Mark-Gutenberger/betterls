# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-05T00:44:19.621Z

SHELL = /bin/bash #! /bin/bash
SRC_DIR = ./src/
TARGET = colorls.cpp
VERSION = $(shell node ./scripts/version.js)
CXX = g++
OUT_DIR = ./bin/
OBJ_DIR = obj/
ASM_DIR = asm/
PLATFORM = $(shell echo ${OS})
CXXFLAGS =
LINKFLAGS = -lpthread

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
	$(CXX) -c ./colorls.cpp -o $(OUT_DIR)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o $(LINKFLAGS) $(CXXFLAGS)
	$(CXX) $(OUT_DIR)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(LINKFLAGS) $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(OUT_DIR)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm $(LINKFLAGS) $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main.exe


clean:
	rm -rf ./bin/*
	rm -rf ./.vs/
	mkdir ./bin
	mkdir ./bin/obj
	mkdir ./bin/asm
