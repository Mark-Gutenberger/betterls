# SPDX-License-Identifier: MIT
# Author: Mark Gutenberger <mark-gutenberger@outlook.com>
# Makefile (c) 2022
# Desc: description
# Created:  2022-05-02T13:19:36.646Z
# Modified: 2022-05-12T21:49:09.794Z

###
# glob consts
###
SHELL = /bin/bash #! /bin/bash

###
# dir consts
###
_SRC = ./src/
_BIN = ./bin/
BIN = /bin/
_TESTS = ./tests/
OBJ = obj/
OUT = $(_BIN)$(PLATFORM)/

###
# proj consts
###
TARGET = colorls.cpp
VERSION = $(shell . ./scripts/version.sh)

###
# C++ consts
###
CXX = g++
CXXFLAGS = -std=c++2a -lryml

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
	@printf '\nWARN: if you are using a windows enviroment, colored makefile output probably will not work.\n'
	@printf 'Comment out these two lines in the makefile to silence this warning.\n\n'
	$(SETC) $(RESET)
	make prebuild
	$(SETC) $(BLUE)
	make clean
	$(SETC) $(RESET)
	$(SETC) $(PURPLE)
	@printf '\nVersion: $(VERSION)\n\n'
	@printf 'Semantic executable names use the following syntax:\n'
	@printf '  <app>-<platform>-<version>\n\n\n'
	$(SETC) $(RESET)
	$(SETC) $(BLUE)
	make compile
	$(SETC) $(BLUE)
	@echo '$(shell date)' >> $(_BIN).last-compile
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
	make compile
	$(SETC) $(BLUE)
	$(SETC) $(RESET)
	$(SETC) $(GREEN)
	@printf '\nSuccess!\n\n'
	$(SETC) $(RESET)


compile:
	$(SETC) $(RESET)
	$(CXX) -c ./colorls.cpp -o $(_BIN)$(OBJ)colorls-$(PLATFORM)-$(VERSION).o  $(CXXFLAGS)
	$(CXX) $(_BIN)$(OBJ)colorls-$(PLATFORM)-$(VERSION).o -o $(OUT)colorls-$(PLATFORM)-$(VERSION)  $(CXXFLAGS)
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION) $(OUT)colorls
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION) $(_BIN)colorls
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION) $(OUT)main
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION) $(_BIN)main
	# copy files with 'exe' ext becuase sometimes msys does weird things
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION) $(OUT)colorls-$(PLATFORM)-$(VERSION).exe
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION).exe $(_BIN)colorls.exe
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION).exe $(OUT)colorls.exe
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION).exe $(_BIN)main.exe
	$(shell) cp $(OUT)colorls-$(PLATFORM)-$(VERSION).exe $(OUT)main.exe
	$(SETC) $(RESET)
	@printf '\n'

test:
	make prebuild
	make clean
	make test-yaml

test-yaml:
	$(SETC) $(RESET)
	$(CXX) -c $(_TESTS)test-ryml.cpp -o $(_TESTS)$(BIN)$(OBJ)test-ryml.o  $(CXXFLAGS)
	$(CXX) $(_TESTS)$(BIN)$(OBJ)test-ryml.o -o $(_TESTS)$(BIN)test-ryml $(CXXFLAGS)
	$(SETC) $(RESET)
	@printf '\n'

clean:
	$(SETC) $(YELLOW)
	@printf '\n'
	rm -rf $(_BIN)*
	rm -rf ./.vs/
	mkdir -p $(_BIN)
	mkdir -p $(_BIN)$(PLATFORM)
	mkdir -p $(_BIN)$(OBJ)
	mkdir -p $(_TESTS)$(BIN)
	mkdir -p $(_TESTS)$(BIN)$(PLATFORM)
	mkdir -p $(_TESTS)$(BIN)$(OBJ)
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
