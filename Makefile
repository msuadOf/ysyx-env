# Config first!
IMG-TAG=try1
HOST-PORT=6633
GUEST-PORT=22
NEMU_HOME ?= /home/qsuad/msuad-ysyx-workbench/nemu
HOST-WORKDIR := $(NEMU_HOME)/../

build:Dockerfile
	docker build -t ysyx-env:$(IMG-TAG) .

start:build
	chmod -R 777 ${HOST-WORKDIR}
	docker run -itd -p 127.0.0.1:$(HOST-PORT):$(GUEST-PORT)/tcp -v ${HOST-WORKDIR}:/workplace/ysyx-workbench  ysyx-env:$(IMG-TAG) bash

.PHONY:start

