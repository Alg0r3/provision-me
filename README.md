# ProvisionMe

This repository contains Ansible playbooks and roles for setting up various development environments. Whether you're 
setting up PHP, Docker, or any other stack, this repository aims to provide a reusable, modular, and straightforward way
to automate these tasks.

## Table of Contents

- Requirements

## Requirements

For the control node (the machine that runs Ansible) :

- Python 3.9 or higher

For the managed node (the machine that Ansible is managing) :

- Python 3.5 - 3.11


> Note : you might need to install additional libraries that are provided with the development package python3-dev if
> your current Python installation is minimalistic.

```shell
apt install python3-dev
```

Source : https://wiki.python.org/moin/BeginnersGuide/Download

pip is the package installer for Python. To verify whether pip is already installed :

```shell
python3 -m pip -V
```

You can install the latest pip directly from the Python Packaging Authority by running the following:

```shell
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
```

When you install a Python package with the flag --user, it goes into a directory under your home folder. You might need
to add this to your path :

```shell
PATH="$PATH:$HOME/.local/bin
```

- Ansible core 2.15.5 or higher (older versions weren't tested but might work)

To install the full Ansible package :

```shell
python3 -m pip install --user ansible
```

You can check if it was installed properly with :

```shell
ansible --version
```

Source : https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

## Tests

- Molecule 6.0.2 or higher (older versions weren't tested but might work)

To install Molecule :

```shell
python3 -m pip install --user molecule
```

To install ansible-lint :

```shell
python3 -m pip install --user ansible-lint
```

To install the driver for docker molecule :

```shell
python3 -m pip install --user "molecule-plugins[docker]"
```

Source : https://ansible.readthedocs.io/projects/molecule/installation/

TODO List :
- complete the Symfony playbook
- write a Docker playbook
- write a OhMyZSH playbook
- write a Molecule playbook
