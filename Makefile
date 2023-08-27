##
# 
##

###############################################################################
# Variables
###############################################################################

# Get Makefile directory
MAKEFILE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

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