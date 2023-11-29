#!/bin/bash

# Determine the absolute path to the roles directory
ROLES_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")/roles" && pwd)"

# Define the root-level molecule directory
ROOT_MOLECULE_DIR="./molecule"

# Loop through each scenario in the root-level molecule directory and update its molecule.yml
for scenario_dir in "$ROOT_MOLECULE_DIR"/*/; do
  if [[ -f "$scenario_dir/molecule.yml" ]]; then
    sed -i "s|ANSIBLE_ROLES_PATH: .*|ANSIBLE_ROLES_PATH: $ROLES_PATH|" ./"$scenario_dir"/molecule.yml
  fi
done
