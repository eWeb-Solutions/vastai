#!/bin/bash

# Cause the script to exit on failure.
set -eo pipefail

# Activate the main virtual environment
. /venv/main/bin/activate

git clone https://github.com/lllyasviel/FramePack ./
