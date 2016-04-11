#!/usr/bin/env sh

cat presentation.md \
    | tail -n+61 \
    | sed 's,-> ,,g' \
    | jq --slurp --raw-input '{"text": "\(.)", "mode": "markdown"}' \
    | curl --data @- https://api.github.com/markdown \
    > presentation.html
