OUT_DIR=bin
EXECUTABLE=miso
SRC_ENTRY=src/miso/cli.cr
LOCAL_EXE=$(OUT_DIR)/$(EXECUTABLE)

build:
	$(info $(shell tput bold)Building $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold)...$(shell tput sgr0))
	@crystal build $(SRC_ENTRY) --release --no-debug -o $(LOCAL_EXE)

run:
	@crystal $(SRC_ENTRY)

test:
	@crystal spec

clean:
	@rm $(LOCAL_EXE)

tag:
	@bin/tag

.PHONY: build run test clean tag
