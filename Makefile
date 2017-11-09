OUT_DIR=bin
EXECUTABLE=miso
SRC_ENTRY=src/miso/cli.cr
LOCAL_EXE=$(OUT_DIR)/$(EXECUTABLE)
INSTALL_DIR=/usr/local/bin

build:
	$(info $(shell tput bold)Building $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold)...$(shell tput sgr0))
	@crystal build $(SRC_ENTRY) --release --no-debug -o $(LOCAL_EXE)
	$(info $(shell tput bold)  => Built $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold) :D$(shell tput sgr0))

install: build
	$(info $(shell tput bold)Installing $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold) in $(shell tput setaf 1)$(INSTALL_DIR)$(shell tput sgr0 && tput bold)...$(shell tput sgr0))
	@mkdir -p $(INSTALL_DIR)
	@cp $(LOCAL_EXE) $(INSTALL_DIR)
	$(info $(shell tput bold)  => Installed $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold) :D$(shell tput sgr0))

reinstall: build
	$(info $(shell tput bold)Re-installing $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold) in $(shell tput setaf 1)$(INSTALL_DIR)$(shell tput sgr0 && tput bold)...$(shell tput sgr0))
	@cp -f $(LOCAL_EXE) $(INSTALL_DIR)
	$(info $(shell tput bold)  => Reinstalled $(shell tput setaf 1)miso$(shell tput sgr0 && tput bold) :D$(shell tput sgr0))

run:
	@crystal $(SRC_ENTRY)

test:
	@crystal spec

tag:
	@bin/tag

clean:
	@rm $(LOCAL_EXE)

.PHONY: build install resinstall run test tag clean
