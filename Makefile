# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-08T18:32:09.200Z

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
CXXFLAGS = -std=c++17 -lpthread

###
# OS consts
###
PLATFORM = $(shell echo ${OS})

###
# colors
###
ifneq (,$(findstring xterm,${TERM}))
	BLACK               := $(shell tput -Txterm setaf 0)
	RED                 := $(shell tput -Txterm setaf 1)
	GREEN               := $(shell tput -Txterm setaf 2)
	YELLOW              := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE         := $(shell tput -Txterm setaf 4)
	PURPLE              := $(shell tput -Txterm setaf 5)
	BLUE                := $(shell tput -Txterm setaf 6)
	WHITE               := $(shell tput -Txterm setaf 7)
	BRIGHT_BLACK        := $(shell tput -Txterm setaf 10)
	BRIGHT_RED          := $(shell tput -Txterm setaf 11)
	BRIGHT_GREEN        := $(shell tput -Txterm setaf 12)
	BRIGHT_YELLOW       := $(shell tput -Txterm setaf 13)
	BRIGHT_LIGHTPURPLE  := $(shell tput -Txterm setaf 14)
	BRIGHT_PURPLE       := $(shell tput -Txterm setaf 15)
	BRIGHT_BLUE         := $(shell tput -Txterm setaf 16)
	BRIGHT_WHITE        := $(shell tput -Txterm setaf 17)
	RESET               := $(shell tput -Txterm sgr0)
else
	BLACK               := ''
	RED                 := ''
	GREEN               := ''
	YELLOW              := ''
	LIGHTPURPLE         := ''
	PURPLE              := ''
	BLUE                := ''
	WHITE               := ''
	BRIGHT_BLACK        := ''
	BRIGHT_RED          := ''
	BRIGHT_GREEN        := ''
	BRIGHT_YELLOW       := ''
	BRIGHT_LIGHTPURPLE  := ''
	BRIGHT_PURPLE       := ''
	BRIGHT_BLUE         := ''
	BRIGHT_WHITE        := ''
	RESET               := ''
endif


.PHONY: all compile clean windows linux install install-deps prebuild

all:
	@printf '\nWARN: if you are using a windows enviroment, colorized makefile output probably will not work.\n'
	@printf 'Comment out these two lines in the makefile to silence this warning.\n\n'
	make prebuild
	make clean
	@printf '\n$(GREEN)Version: $(VERSION)\n'
	@printf 'Version: $(VERSION)\n\n'
	@printf 'Semantic executable names use the following syntax:\n'
	@printf '  <app>-<platform>-<version>\n\n\n'
	make linux
	make windows
	@echo '$(shell date)' >> $(BIN).last-compile

windows:
	$(CXX) -c ./colorls.cpp -o $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe  $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(BIN)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm  $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(BIN)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)colorls.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(BIN)main.exe
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION).exe $(OUT_DIR)main.exe

linux:
	$(CXX) -c ./colorls.cpp -o $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(BIN)$(OBJ_DIR)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION)  $(CXXFLAGS)
	$(CXX) -S ./colorls.cpp -o $(BIN)$(ASM_DIR)colorls-$(PLATFORM)-$(VERSION).asm  $(CXXFLAGS)
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(OUT_DIR)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(BIN)colorls
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(OUT_DIR)main
	$(shell) cp $(OUT_DIR)colorls-$(PLATFORM)-$(VERSION) $(BIN)main


clean:
	rm -rf ./bin/*
	rm -rf ./.vs/
	mkdir -p ./bin
	mkdir -p ./bin/$(PLATFORM)
	mkdir -p ./bin/obj
	mkdir -p ./bin/asm

install-deps:
	yarn install

prebuild:
	$(SHELL) ./scripts/prebuild.sh
	make install-deps
