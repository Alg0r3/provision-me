# AGENTS.md

## Project Intent

ProvisionMe is a personal Ansible workspace for rebuilding and maintaining
working environments from setup notes. Optimize for the owner's machines first,
especially the Fedora workstation. Debian support is useful where practical,
including for possible home lab use.

## Working Style

- Prefer small, reviewable changes.
- Inspect relevant files before proposing structure changes.
- When building or changing Ansible roles, explain the Ansible concepts and
  tradeoffs behind the implementation so the owner can learn from the work.
- Preserve the current simple local workflow: project `.venv`, local
  `.ansible/collections`, Makefile targets, and Podman-backed Molecule tests.
- Keep roles composable and playbooks focused on coordinating complete
  environments.
- Treat a role as one independently managed capability, not necessarily one
  package or one command.
- Avoid broad rewrites unless explicitly requested.

## Role Guidance

Roles may represent tools, runtimes, language environments, machine baselines,
or shared setup concerns.

A role should usually have at least one reason to exist independently:

- non-trivial install logic
- configuration files or templates
- operating-system specific behavior
- variables or defaults worth exposing
- Molecule coverage
- reuse across more than one playbook

Small baseline packages should usually live in a broader role instead of getting
one role each.

## Documentation And Future Work

Use `docs/design-notes.md` for stable project intent and design decisions.

Use `docs/development-plan.md` for cleanup work, technical debt, follow-up
tasks, and useful ideas found during a session.

Near the end of each session, review what was learned or deferred. If there are
concrete follow-ups worth preserving, update `docs/development-plan.md` instead
of leaving them only in chat.

## Verification

When changing Ansible roles or Molecule scenarios, run the narrowest useful
checks first, such as:

```shell
make lint
make test-role ROLE=<role>
```

If sandboxing or local host constraints make verification unreliable, report the
exact command and failure instead of treating the result as authoritative.

Prefer Molecule for role behavior tests. Use direct Python tests for standalone
Python code or pure logic, such as custom Ansible modules, filter plugins,
inventory scripts, helper scripts, or parsing and normalization functions.
