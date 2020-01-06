ROOT:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
IMAGE_NAME:=boristsr/jenkins-ssh-slave:latest

build:
	docker build -t ${IMAGE_NAME} .
