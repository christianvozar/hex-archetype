# Makefile

APP_NAME := myapp
SCRIPTS_DIR := scripts

.PHONY: all
all: build

.PHONY: build
build:
	@$(SCRIPTS_DIR)/build.sh $(APP_NAME)

.PHONY: clean
clean:
	@$(SCRIPTS_DIR)/clean.sh $(APP_NAME)

.PHONY: test
test:
	@$(SCRIPTS_DIR)/test.sh

.PHONY: test
test:
	@$(SCRIPTS_DIR)/e2e.sh

.PHONY: run
run: build
	@./bin/$(APP_NAME)

.PHONY: lint
lint:
	@$(SCRIPTS_DIR)/lint.sh
