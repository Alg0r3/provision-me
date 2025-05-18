# ProvisionMe

This repository contains Ansible playbooks and roles for setting up various development environments. Whether you're 
setting up PHP, Docker, or any other stack, this repository aims to provide a reusable, modular, and straightforward way
to automate these tasks.

## Table of Contents

- [Requirements](#Requirements)
- [TODO](#TODO)

## Requirements

For the control node (the machine that runs Ansible):

- [ansible-navigator](https://ansible.readthedocs.io/projects/navigator/installation)
- [ansible-builder](https://ansible.readthedocs.io/projects/builder/en/latest/installation)
- [podman](https://podman.io/docs/installation)

> Note: or you can use Docker instead of Podman, you'll need to tinker with some settings to make it work.

## TODO

- [ ] Update README
- [ ] Write a CLI playbook
- [ ] Write a Docker playbook
- [ ] Write a Podman playbook
- [ ] CI/CD

