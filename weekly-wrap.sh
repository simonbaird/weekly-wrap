#!/bin/bash
set -euo pipefail

JIRA_PROJECT="${JIRA_PROJECT:-"EC"}"
WORD_COUNT="${WORD_COUNT:-"320"}"
CI="${CI:-""}"

if [ -z "$CI" ]; then
  PRINT_FLAG=""
else
  # This makes claude run silently and quit when it's done
  PRINT_FLAG="--print"
fi

cat prompt.md |
  JIRA_PROJECT="$JIRA_PROJECT" \
  WORD_COUNT="$WORD_COUNT" \
  envsubst '$JIRA_PROJECT $WORD_COUNT' |
  claude $PRINT_FLAG --permission-mode acceptEdits

mkdir -p output
REPORT_TS=output/report-$(date +'%Y%m%d-%H%M%S')

# We expect claude to create report.md
mv report.md $REPORT_TS.md

# For convenience let's make an html version
python -m markdown < $REPORT_TS.md > $REPORT_TS.html

if [ -z "$CI" ]; then
  # Take a look
  xdg-open $REPORT_TS.html
fi
