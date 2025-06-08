#!/bin/bash
set -e
for f in scripts/*.ps1; do
  if [ ! -s "$f" ]; then
    echo "Script $f is empty" >&2
    exit 1
  fi
  echo "Found $f"
done
