#!/bin/bash
set -euo pipefail

if [ -n "${CI:-""}" ]; then
  # This flag makes claude run silently and quit when it's done
  PRINT_FLAG="--print"
fi

cat prompt.md |
  JIRA_PROJECT="${JIRA_PROJECT:-"EC"}" envsubst '$JIRA_PROJECT' |
  claude ${PRINT_FLAG:-""} --permission-mode acceptEdits

# We expect claude to create report.md
REPORT_TS=report-$(date +'%Y%m%d-%H%M%S')
mv report.md $REPORT_TS.md
