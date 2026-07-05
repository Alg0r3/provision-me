# Design Notes

ProvisionMe exists to turn manual setup notes into repeatable Ansible
automation. When I install a tool, runtime, or development setup on my laptop, I
often note the commands I ran and the settings I chose. This repository is where
those notes become roles and playbooks, so a future machine can be rebuilt
without rediscovering the same steps.

The main target is my Fedora workstation. Debian is also worth supporting where
practical because some roles and playbooks may later be useful on Debian-based
machines, including a home lab.

## Roles

Roles should represent independently managed capabilities.

Often that means one role per tool, such as `wezterm` or `fish`. That works well
when the tool has its own installation source, configuration, operating-system
differences, defaults, or tests.

The model is broader than one role per tool. A role can also represent a
runtime, language environment, machine baseline, or shared setup concern. For
example, roles such as `python`, `php`, `node`, `bootstrap`, `fonts`, or
`dotfiles` can make sense if they own a coherent part of the machine setup.

Small packages that are only baseline dependencies should usually live in a
broader role instead of becoming one role each.

## Playbooks

Playbooks coordinate roles into complete working environments.

Examples of useful playbooks might include:

- a workstation playbook for the main laptop setup
- a PHP development playbook
- a TypeScript or Node development playbook
- a home lab playbook

The roles should stay composable. The playbooks should express the intent:
which environment is being built, which capabilities are needed, and in what
order they should be applied.

## Dotfiles

The `dotmaster` repository may eventually become part of this workflow. The
likely shape is a dedicated `dotfiles` or `dotmaster` role, or a specific
playbook step that applies personal configuration after the relevant tools are
installed.

Tool roles should generally install and prepare tools. Dotfile management should
stay centralized unless a tool has configuration that clearly belongs inside the
role itself.

## WezTerm Nightly

The WezTerm role intentionally installs the nightly package. The primary target
is a Fedora workstation, where newer desktop and terminal tooling is acceptable,
and the stable WezTerm release can lag behind current development.

If this role later needs to support more conservative machines, nightly versus
stable should become a role variable instead of an implicit policy.

## Testing

Molecule is the default way to test role behavior. It is the right tool when the
test needs a target system, package manager, service manager, repository, file
ownership, command, or operating-system difference.

Direct Python tests are useful when there is standalone Python code or pure
logic to verify without provisioning a machine. Examples include custom Ansible
modules, filter plugins, inventory scripts, helper scripts, generated config
validation, or parsing and normalization functions.

Python tests should not replace Molecule for behavior that only proves itself on
a real target container, such as package installation, repository setup, shell
changes, idempotence, or Fedora versus Debian task behavior.
