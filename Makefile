# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-11T00:29:09.163Z

###
# glob consts
###
SHELL = /bin/bash #! /bin/bash

###
# dir consts
###
SRC_DIR = ./src/
OBJ_DIR = obj/
ASM_DIR = asm/
BIN = ./bin/
OUT_DIR = $(BIN)$(PLATFORM)/

###
# proj consts
###
TARGET = colorls.cpp
VERSION = $(shell . ./scripts/version.sh)

###
# C++ consts
###
CXX = g++
CXXFLAGS = -std=c++2a

###
# OS consts
###
PLATFORM = $(shell echo ${OS})

###
# colors
###
SETC = @printf
ifneq (,$(findstring xterm,${TERM}))
	BLACK               := $(shell tput -Txterm setaf 0)
	RED                 := $(shell tput -Txterm setaf 1)
	GREEN               := $(shell tput -Txterm setaf 2)
	YELLOW              := $(shell tput -Txterm setaf 3)
	BLUE                := $(shell tput -Txterm setaf 4)
	PURPLE              := $(shell tput -Txterm setaf 5)
	CYAN                := $(shell tput -Txterm setaf 6)
	WHITE               := $(shell tput -Txterm setaf 7)
	RESET               := $(shell tput -Txterm setaf 7)
else
	BLACK               := ''
	RED                 := ''
	GREEN               := ''
	YELLOW              := ''
	BLUE                := ''
	PURPLE              := ''
	CYAN                := ''
	WHITE               := ''
	RESET               := ''
endif


.PHONY: all compile clean windows linux install install-deps prebuild

all:
	$(SETC) $(YELLOW)
	@printf '\nWARN: if you are using a windows enviroment, colorized makefile output probably will not work.\n'
	@printf 'Comment out these two lines in the makefile to silence this warning.\n\n'
	$(SETC) $(RESET)
	make prebuild
	$(SETC) $(YELLOW)
	make clean
	$(SETC) $(RESET)
	$(SETC) $(PURPLE)
	@printf '\nVersion: $(VERSION)\n\n'
	@printf 'Semantic executable names use the following syntax:\n'
	@printf '  <app>-<platform>-<version>\n\n\n'
	$(SETC) $(RESET)
	$(SETC) $(BLUE)
	make linux
	$(SETC) $(BLUE)
	make windows
	@echo '$(shell date)' >> $(BIN).last-compile
	$(SETC) $(RESET)
	$(SETC) $(GREEN)
	@printf '\nSuccess!\n\n'
	$(SETC) $(RESET)

dev:
	$(SETC) $(YELLOW)
	make clean
	$(SETC) $(RESET)
	$(SETC) $(PURPLE)
	@printf '\nVersion: $(VERSION)\n\n'
	@printf 'Semantic executable names use the following syntax:\n'
	@printf '  <app>-<platform>-<version>\n\n\n'
	$(SETC) $(RESET)
	$(SETC) $(BLUE)
	make linux
	$(SETC) $(BLUE)
	make windows
	@echo '$(shell date)' >> $(BIN).last-compile
	$(SETC) $(RESET)
	$(SETC) $(GREEN)
	@printf '\nSuccess!\n\n'
	$(SETC) $(RESET)

windows:
	$(SETC) $(RESET)
	$(CXX) -c ./colorls.cpp -o $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe  $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(BIN)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm  $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(BIN)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(BIN)main.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main.exe
	$(SETC) $(RESET)
	@printf '\n'

linux:
	$(SETC) $(RESET)
	$(CXX) -c ./colorls.cpp -o $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION)  $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(BIN)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm  $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(OUT_DIR)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(BIN)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(OUT_DIR)main
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(BIN)main
	$(SETC) $(RESET)
	@printf '\n'


clean:
	$(SETC) $(YELLOW)
	@printf '\n'
	rm -rf ./bin/*
	rm -rf ./.vs/
	mkdir -p ./bin
	mkdir -p ./bin/$(PLATFORM)
	mkdir -p ./bin/obj
	mkdir -p ./bin/asm
	@printf '\n'
	$(SETC) $(RESET)

install-deps:
	$(SETC) $(BLUE)
	@printf '\n'
	$(SETC) $(RESET)
	yarn install
	@printf '\n'

prebuild:
	$(SHELL) ./scripts/prebuild.sh
	$(SETC) $(GREEN)
	# make install-deps
	$(SETC) $(RESET)
