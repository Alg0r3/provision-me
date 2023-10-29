.PHONY: help install-requirements playbook-symfony

help: ## Display available commands
	@grep --extended-regexp '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install-requirements: ## Install all the requirements for running playbooks and roles
	@ansible-galaxy collection install \
		--requirements-file ./ansible/collections/requirements.yaml \
		--collections-path ./ansible/collections/

playbook-symfony: ## Run the playbook that sets up a local symfony environment
	ansible-playbook --inventory ./ansible/hosts.ini ./ansible/playbooks/setup_local_symfony_environment.yaml
