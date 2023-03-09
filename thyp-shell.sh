#!/bin/bash

source .env

if [[ -z "${@}" ]]; then
  echo "login to thyp-sdk shell: (default user/pass: nebula/nebula)"
else
  echo "executing shell command in thyp-sdk: $@"
fi
echo ""
ssh -X -p 8022 ${USERNAME}@127.0.0.1 $@

