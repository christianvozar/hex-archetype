#!/bin/bash

# build.sh

set -e

APP_NAME=$1
BUILD_DIR=bin

mkdir -p ${BUILD_DIR}
go build -o ${BUILD_DIR}/${APP_NAME} ./cmd/${APP_NAME}