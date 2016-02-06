help:
	@echo "\
help                   this message\n\
shell                  setup local environment, and drop into shell\n\
teardown               destroy all depndencies \n\
"

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
MAKE_GO_SRC  :=$(ROOT_DIR)/src

define pinfo
@printf "\033[0;33m-- $1\033[0m\n"
endef

shell:
	$(call pinfo,entering shell - mounting $(src_dir).)
	GO_SRC="$(MAKE_GO_SRC)" docker-compose run --rm go-native-builder /bin/bash

shell-pi:
		$(call pinfo,entering shell - mounting $(src_dir).)
		GO_SRC="$(MAKE_GO_SRC)" docker-compose run --rm -e GOOS=linux -e GOARCH=arm go-native-builder /bin/bash

teardown:
	$(call pinfo,tearing down local env)
	docker-compose kill
	docker-compose rm -v
