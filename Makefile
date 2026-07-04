.DEFAULT_GOAL := help

PYTHON ?= python3
VENV ?= .venv
VENV_BIN := $(VENV)/bin
COLLECTIONS_PATH ?= .ansible/collections
FEDORA_VERSION ?= 44
DEBIAN_VERSION ?= 13

export PATH := $(abspath $(VENV_BIN)):$(PATH)
export FEDORA_VERSION
export DEBIAN_VERSION

.PHONY: install
install: ## Create/update the local virtual environment and install dependencies.
	@$(PYTHON) -m venv "$(VENV)"
	@"$(VENV_BIN)/python" -m pip install --upgrade pip setuptools wheel
	@"$(VENV_BIN)/python" -m pip install --requirement requirements.txt
	@mkdir --parents "$(COLLECTIONS_PATH)"
	@ansible-galaxy collection install --requirements-file requirements.yml --collections-path "$(COLLECTIONS_PATH)"

.PHONY: lint
lint: ## Run Ansible lint.
	@ansible-lint .

.PHONY: test
test: ## Run all Molecule scenarios.
	@molecule test --all

.PHONY: test-role
test-role: ## Run one Molecule scenario. Usage: make test-role ROLE=wezterm
	@test -n "$(ROLE)" || { echo "ROLE is required. Example: make test-role ROLE=wezterm"; exit 2; }
	@molecule test --scenario-name "$(ROLE)"

.PHONY: doctor
doctor: ## Check whether the local development dependencies are available.
	@echo "Checking system tools..."
	@command -v git >/dev/null || { echo "missing: git"; exit 1; }
	@command -v $(PYTHON) >/dev/null || { echo "missing: $(PYTHON)"; exit 1; }
	@$(PYTHON) --version
	@$(PYTHON) -m venv --help >/dev/null || { echo "missing: Python venv support"; exit 1; }
	@command -v podman >/dev/null || { echo "missing: podman"; exit 1; }
	@podman --version
	@podman info >/dev/null || { echo "podman is installed, but 'podman info' failed. Fix Podman before running Molecule."; exit 1; }
	@echo "Checking project environment..."
	@test -x "$(VENV_BIN)/python" || { echo "missing: $(VENV). Run make install."; exit 1; }
	@"$(VENV_BIN)/python" -m pip --version >/dev/null || { echo "missing: pip in $(VENV). Run make install."; exit 1; }
	@command -v ansible >/dev/null || { echo "missing: ansible in $(VENV). Run make install."; exit 1; }
	@command -v ansible-lint >/dev/null || { echo "missing: ansible-lint in $(VENV). Run make install."; exit 1; }
	@command -v molecule >/dev/null || { echo "missing: molecule in $(VENV). Run make install."; exit 1; }
	@echo "Development environment looks ready."

.PHONY: help
help: ## Show this help message.
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
