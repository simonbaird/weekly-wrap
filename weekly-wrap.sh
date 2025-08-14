#!/bin/bash
set -euo pipefail

if [ -n "${CI:-""}" ]; then
  # This flag makes claude run silently and quit when it's done
  PRINT_FLAG="--print"
fi

claude ${PRINT_FLAG:-""} --permission-mode acceptEdits < prompt.md
