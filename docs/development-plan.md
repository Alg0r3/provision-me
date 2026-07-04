# Development Environment Cleanup Plan

This note captures the remaining work after simplifying the local Ansible and
Molecule development workflow.

## Current State

- Local Python tooling is installed in `.venv`.
- Ansible Galaxy collections are installed in `.ansible/collections`.
- Podman is the default Molecule driver.
- Ansible Navigator and Ansible Builder are not part of the default workflow.
- `pipx` can stay installed globally, but it is not used by this project.

## Verified

- `make doctor` passes on the host.
- `make install` creates/updates the local project environment.
- `make lint` passes with 0 failures and 0 warnings.
- `make test-role ROLE=bootstrap` passes on the host.
- `make test-role ROLE=wezterm` passes on the host.

## Remaining Work

- Review and manually remove obsolete project-related collections from
  `~/.ansible`, if any exist.
- Review useful material from `feature/terminal-playbook`.
- Review and clean the WIP `feature/fish-role`.
- Replace deprecated `ansible.builtin.apt_repository` usage in the WezTerm
  Debian tasks.
- Reduce Molecule warning noise from named scenarios and missing optional
  dependency/cleanup files.
- Add top-level playbooks after the local development workflow is reliable.
