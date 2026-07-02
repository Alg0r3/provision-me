# ProvisionMe

ProvisionMe is my personal Ansible workspace for restoring and maintaining the
way I like to use my machines. It is meant to help rebuild my terminal, shell,
developer tooling, packages, libraries, and other setup details if I need to
start from a fresh system.

Most roles target my current Fedora workstation first. Debian is also a target
because I may eventually use these roles and playbooks on a Debian-based home
lab.

The first priority is keeping the local development workflow simple and
repeatable. This project uses a local Python virtual environment for Ansible
tooling and Podman-backed Molecule scenarios for role tests.

## Requirements

Install these system tools before setting up the project:

- `git`
- `make`
- `python3`
- Python `venv` support
- `podman`

## Setup

Check whether the machine has the expected system tools:

```shell
make doctor
```

On a fresh checkout, this is expected to report that `.venv` is missing. Create
or update the local development environment with:

```shell
make install
```

The Makefile calls tools from `.venv` directly, so activating the virtual
environment is optional for the Make targets. If you want to run commands by
hand, activate it first.

With fish:

```shell
source .venv/bin/activate.fish
```

With bash or zsh:

```shell
source .venv/bin/activate
```

Then verify the setup again:

```shell
make doctor
```

## Common Commands

```shell
make install
make doctor
make lint
make test
make test-role ROLE=bootstrap
make test-role ROLE=wezterm
```

## Dependency Model

There are three dependency layers:

- System packages provide base tools such as Python and Podman.
- `.venv` contains local Python tooling such as `ansible-core`, `ansible-lint`,
  `molecule`, and the Molecule Podman plugin.
- `.ansible/collections` contains local Ansible Galaxy collections installed
  from `requirements.yml`.

Keeping Ansible, Molecule, and Galaxy collections inside the project makes the
setup independent from global Python packages and user-level Ansible
collections. Podman is used by Molecule to create disposable Linux containers
that act as test machines.

## Project Layout

```text
roles/            Reusable Ansible roles
molecule/         Molecule scenarios for role testing
requirements.txt  Python development tooling
requirements.yml  Ansible Galaxy collections
.ansible/         Local generated Galaxy collection install path
```

Top-level playbooks will be added after the local development workflow is
stable.
