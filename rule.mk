# V=1时不显示命令执行过程
ifeq ("$(origin V)", "command line")
  BUILD_VERBOSE = ${V}
endif
ifndef BUILD_VERBOSE
  BUILD_VERBOSE = 0
endif

ifeq (${BUILD_VERBOSE}, 1)
  Q = @
else
  Q = 
endif

SHELL := /bin/bash

CUR_DIR := $(shell pwd)

INCS := ${CUR_DIR}/include
CFLAGS := -Wall -I${INCS}

DEP := ${CUR_DIR}/depend

OBJ := ${CUR_DIR}/object

ifeq ($(wildcard ${DEP}), )
  $(shell mkdir -p ${DEP})
endif

ifeq ($(wildcard ${OBJ}), )
  $(shell mkdir -p ${OBJ})
endif

src_cpp = $(wildcard *.cpp)
objects = $(patsubst %.cpp, ${OBJ}/%.o, $(src_cpp))
depends = $(patsubst %.cpp, ${DEP}/%.d, $(src_cpp))
