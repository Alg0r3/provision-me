---
name: Maintenance / chore
about: Track cleanup, tooling, dependency, documentation, or CI work
title: ''
labels: chore
assignees: ''

---

## Goal

Describe the cleanup or maintenance outcome.

## Context

Why is this worth doing now?

## Scope

Included:

- ...

Not included:

- ...

## Acceptance criteria

- [ ] The maintenance change is complete.
- [ ] Unrelated behavior is left unchanged.
- [ ] Documentation is updated if workflow or usage changes.
- [ ] Relevant verification passes.

## Verification

Expected commands:

```shell
make doctor
make lint
```

Add role-specific tests when relevant:

```shell
make test-role ROLE=<role>
```

## Notes

Links, references, or follow-up work.

