# ProvisionMe

This repository contains Ansible playbooks and roles for setting up various development environments. Whether you're 
setting up PHP, Docker, or any other stack, this repository aims to provide a reusable, modular, and straightforward way
to automate these tasks.

## Table of Contents

- [Requirements](#Requirements)
- [TODO](#TODO)

## Requirements

For the control node (the machine that runs Ansible) :

- [ansible-navigator](https://ansible.readthedocs.io/projects/navigator/installation)
- [podman](https://podman.io/docs/installation)

> Note: or you can use Docker instead of Podman, you'll need to tinker with some settings to make it work.

For the managed node (the machine that Ansible is managing) :

- Python 3.5+

## TODO

- [ ] complete the Symfony playbook
- [ ] write a Docker playbook
- [ ] write a Molecule playbook
- [ ] write a Terminal playbook
- [ ] CI/CD

