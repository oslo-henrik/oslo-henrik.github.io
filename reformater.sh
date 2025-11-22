#!/bin/sh

if ! command -v prettier; then
    echo "Du mangler 'prettier'. Installer det først."
    exit 1
fi

prettier --write .
