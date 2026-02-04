#!/bin/bash
# build_book.sh

set -euo pipefail
cd -- "${BOOK_DIR:?}"
export BASE_URL="/armageddon"; jupyter book build --execute --html 
