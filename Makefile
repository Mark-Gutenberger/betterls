# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-05T00:55:25.498Z

SHELL = /bin/bash #! /bin/bash
SRC_DIR = ./src/
TARGET = colorls.cpp
VERSION = $(shell node ./scripts/version.js)
CXX = g++
PLATFORM = $(shell echo("\${OS:-$(uname)}"))
OBJ_DIR = obj/
ASM_DIR = asm/
OUT_DIR = ./bin/$(PLATFORM)/
CXXFLAGS =
LINKFLAGS = -lpthread

.PHONY: all compile clean windows linux

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
	make linux
	@echo "$(shell date)" >> $(OUT_DIR).last-compile

windows:
	$(CXX) -c ./colorls.cpp -o $(OUT_DIR)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o $(LINKFLAGS) $(CXXFLAGS)
	$(CXX) $(OUT_DIR)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(LINKFLAGS) $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(OUT_DIR)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm $(LINKFLAGS) $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main.exe

linux:
	$(CXX) -c ./colorls.cpp -o $(OUT_DIR)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o $(LINKFLAGS) $(CXXFLAGS)
	$(CXX) $(OUT_DIR)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(LINKFLAGS) $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(OUT_DIR)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm $(LINKFLAGS) $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main


clean:
	rm -rf ./bin/*
	rm -rf ./.vs/
	mkdir -p ./bin
	mkdir -p ./bin/obj
	mkdir -p ./bin/asm

install-deps:
	yarn install
