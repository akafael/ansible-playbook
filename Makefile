##
# 
##

###############################################################################
# Variables
###############################################################################

# Get Makefile directory
MAKEFILE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

ANSIBLE_PLAYBOOK:=$(MAKEFILE_DIR)/ansible/playbook.yml

###############################################################################
# Rules
###############################################################################

# Print help for Makefile commands
.PHONY: help
help:
	@echo "Use: make -f Makefile [OPTION]"
	@echo "\nOPTIONS"
	@sed Makefile -n -e "N;s/^# \(.*\)\n.PHONY:\(.*\)/ \2:\1/p;D" | column -ts:
	@echo ""

# Ansible Rules ---------------------------------------------------------------

# Install Ansible using pip
.PHONY: install
install:
	pip3 install --user ansible

# Check if the playbook is properly formated
.PHONY: verify
verify: ${ANSIBLE_PLAYBOOK}
	ansible-playbook $< --check --diff

# Run Playbook
.PHONY: run
run: ${ANSIBLE_PLAYBOOK}
	ansible-playbook $< -v