#!/bin/bash
# build_book.sh
set -euo pipefail
jupyter-book clean
./build_book.sh
ghp-import -n -p -f book/_build/html
