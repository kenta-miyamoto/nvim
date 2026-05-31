SHELL := /bin/bash

NVIM ?= nvim
HEALTH_LOG ?= /tmp/nvim-health.txt
MASON_INSTALL_WAIT ?= 120

MASON_TOOLS := lua-language-server gopls rust-analyzer vtsls vue-language-server ruby-lsp prettier biome vale golangci-lint golines

.PHONY: help setup deps plugins tools treesitter check smoke health

help:
	@echo "Targets:"
	@echo "  make setup       Install dependencies, plugins, Mason tools, Treesitter parsers, then run checks"
	@echo "  make deps        Install Homebrew dependencies when brew is available"
	@echo "  make plugins     Install plugins via the built-in vim.pack"
	@echo "  make tools       Install required Mason tools"
	@echo "  make treesitter  Install Treesitter parsers"
	@echo "  make check       Run smoke checks and write checkhealth output"
	@echo "  make smoke       Open sample files in headless Neovim and verify LSP attach"
	@echo "  make health      Run :checkhealth and write output to HEALTH_LOG"

setup: deps plugins tools treesitter check

deps:
	@if command -v brew >/dev/null 2>&1; then \
		brew list neovim >/dev/null 2>&1 || brew install neovim; \
		brew list ripgrep >/dev/null 2>&1 || brew install ripgrep; \
		brew list tree-sitter-cli >/dev/null 2>&1 || brew install tree-sitter-cli; \
		brew tap | grep -qx "daipeihust/tap" || brew tap daipeihust/tap; \
		brew list im-select >/dev/null 2>&1 || brew install im-select; \
	else \
		command -v $(NVIM) >/dev/null 2>&1 || { echo "Neovim is required."; exit 1; }; \
		command -v rg >/dev/null 2>&1 || { echo "ripgrep is required."; exit 1; }; \
		command -v tree-sitter >/dev/null 2>&1 || { echo "tree-sitter CLI is required (nvim-treesitter main branch compiles parsers with it)."; exit 1; }; \
	fi

plugins:
	$(NVIM) --headless +'qa'

tools:
	$(NVIM) --headless +'MasonInstall $(MASON_TOOLS)' +'sleep $(MASON_INSTALL_WAIT)' +'qa'

treesitter:
	$(NVIM) --headless +"lua require('nvim-treesitter').install({ 'go', 'javascript', 'typescript', 'tsx', 'vue', 'markdown', 'markdown_inline' }):wait(300000)" +'qa'

check: smoke health

smoke:
	$(NVIM) --headless test_contents/test.go +'sleep 2' +'lua local c = vim.lsp.get_clients({ bufnr = 0 }); assert(#c > 0 and c[1].name == "gopls", "gopls is not attached")' +'qa'
	$(NVIM) --headless test_contents/test.js +'sleep 2' +'lua local c = vim.lsp.get_clients({ bufnr = 0 }); assert(#c > 0 and c[1].name == "vtsls", "vtsls is not attached")' +'qa'
	$(NVIM) --headless README.md +'qa'

health:
	$(NVIM) --headless +checkhealth +'write! $(HEALTH_LOG)' +'qa'
	@echo "checkhealth output: $(HEALTH_LOG)"
