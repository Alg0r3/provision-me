# Development Environment Cleanup Plan

This note captures the decisions made before starting the cleanup work. It is
intended as a handoff file so the project can be resumed without relying on chat
history.

## Current Goal

Make this repository easy to work on locally before expanding the roles and
playbooks. The main focus is a clear Ansible and Molecule development workflow.

## Decisions

- Use a project-local Python virtual environment at `.venv`.
- Use Podman as the default Molecule driver.
- Keep Ansible Navigator and Ansible Builder out of the default workflow.
- Keep `pipx` installed if present; it is useful but not the project dependency
  mechanism.
- Keep Molecule for role testing.
- Prefer explicit dependencies over a hidden tooling bundle.
- Focus on development setup before reviving old roles or adding new playbooks.

## Planned Changes

- Remove `ansible-navigator.yml`.
- Remove `execution-environment.yml`.
- Remove `bindep.txt` if it only supports Ansible Builder.
- Update `.gitignore` for the local virtual environment and current generated
  files.
- Update `requirements.txt` for local development tooling:
  - `ansible-core`
  - `ansible-lint`
  - `molecule`
  - `molecule-plugins[podman]`
- Keep `requirements.yml` for Ansible Galaxy collections.
- Replace the current Makefile workflow with local commands:
  - `make doctor`
  - `make install`
  - `make lint`
  - `make test`
  - `make test-role ROLE=<scenario>`
- Rewrite the README around the local setup flow and explain the dependency
  layers.

## Verification Plan

- Run `make doctor`.
- Run `make install`.
- Activate `.venv`.
- Confirm tool versions:
  - `ansible --version`
  - `ansible-lint --version`
  - `molecule --version`
- Run `make lint`.
- Run `make test-role ROLE=bootstrap`.
- Run `make test-role ROLE=wezterm` if practical.

## Later Work

- Review useful material from `feature/terminal-playbook`.
- Review and clean the WIP `feature/fish-role`.
- Add top-level playbooks after the local development workflow is reliable.
