#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_DIR=$(dirname "${SCRIPT_DIR}")
if ! [[ -f "${REPO_DIR}/.git/hooks/precommit" ]]
then
  echo './scripts/precommit.sh' > "${REPO_DIR}/.git/hooks/pre-commit"
  chmod +x "${REPO_DIR}/.git/hooks/pre-commit"
fi
"${SCRIPT_DIR}/fmt.sh"
for encrypted_file in {.aws/credentials,secrets.auto.tfvars}
do
  if ! grep '$ANSIBLE_VAULT' "${encrypted_file}"
  then
    echo "File ${encrypted_file} must be encrypted with Ansible Vault before committing"
    exit 1
  fi
done
