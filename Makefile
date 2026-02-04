# Filename: <Makefile>
# Copyright (C) <2022> Authors: <Christian Elmo>
# 
# This program is free software: you can redistribute it and / or 
# modify it under the terms of the GNU General Public License as published 
# by the Free Software Foundation, either version 2 of the License. 
# 
# This program is distributed in the hope that it will be useful, 
# but WITHOUT ANY WARRANTY; without even the implied warranty of  
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
# GNU General Public License for more details.  
# 
# You should have received a copy of the GNU General Public License  
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

CMDS_DIR := ./commands
SHELL := /bin/bash
BOOK_DIR := ./book
BOOK_RUN_PORT := 30001
BOOK_RUN_SERVER_PORT := 31000

export BOOK_RUN_PORT
export BOOK_RUN_SERVER_PORT
export BOOK_DIR

.PHONY: build-book publish-book clean-book run-book

build-book:
	@echo "Building book... at $(BOOK_DIR)"
	$(SHELL) $(CMDS_DIR)/build_book.sh
	@echo "Done."

clean-book:
	@echo "Cleaning book at $(BOOK_DIR)"
	jupyter book clean $(BOOK_DIR)
	rm -rf $(BOOK_DIR)/_build
	@echo "Done."

publish-book: clean-book build-book
	@echo "Publishing book..."
	ghp-import -n -p -f $(BOOK_DIR)/_build/html
	@echo "Done."

run-book:	
	@echo "Running book server..."
	cd $(BOOK_DIR) && \
	jupyter book start --port $(BOOK_RUN_PORT) --server-port $(BOOK_RUN_SERVER_PORT) --execute

run-book-no-exec:
	@echo "Running book server..."
	cd $(BOOK_DIR) && \
	jupyter book start --port $(BOOK_RUN_PORT) --server-port $(BOOK_RUN_SERVER_PORT)
