.DEFAULT_GOAL := help

## Allow passing arguments via the ARG variable (default is empty)
ARG ?=

.PHONY: build
build: ## Build the execution environment (EE) with Ansible Builder.
	@ansible-builder build --container-runtime podman --tag alg0r3/ansible-ee:latest

.PHONY: test
test: ## Run Molecule tests for the given scenario inside the EE.
	@ansible-navigator exec -- molecule test --scenario-name $(ARG)

.PHONY: help
help: ## Show this help message.
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

