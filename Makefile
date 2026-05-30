SHELL := /bin/bash

NVIM ?= nvim
PACKER_DIR ?= $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim
HEALTH_LOG ?= /tmp/nvim-health.txt
MASON_INSTALL_WAIT ?= 120

MASON_TOOLS := gopls vtsls vue-language-server prettier biome vale golangci-lint golines

.PHONY: help setup deps packer plugins tools treesitter check smoke health

help:
	@echo "Targets:"
	@echo "  make setup       Install dependencies, plugins, Mason tools, Treesitter parsers, then run checks"
	@echo "  make deps        Install Homebrew dependencies when brew is available"
	@echo "  make packer      Install packer.nvim if it is missing"
	@echo "  make plugins     Run PackerSync"
	@echo "  make tools       Install required Mason tools"
	@echo "  make treesitter  Update Treesitter parsers"
	@echo "  make check       Run smoke checks and write checkhealth output"
	@echo "  make smoke       Open sample files in headless Neovim and verify LSP attach"
	@echo "  make health      Run :checkhealth and write output to HEALTH_LOG"

setup: deps packer plugins tools treesitter check

deps:
	@if command -v brew >/dev/null 2>&1; then \
		if brew list neovim >/dev/null 2>&1; then \
			brew outdated --quiet neovim | grep -qx "neovim" && brew upgrade neovim || true; \
		else \
			brew install neovim; \
		fi; \
		brew list ripgrep >/dev/null 2>&1 || brew install ripgrep; \
		brew tap | grep -qx "daipeihust/tap" || brew tap daipeihust/tap; \
		brew list im-select >/dev/null 2>&1 || brew install im-select; \
	else \
		command -v $(NVIM) >/dev/null 2>&1 || { echo "Neovim is required."; exit 1; }; \
		command -v rg >/dev/null 2>&1 || { echo "ripgrep is required."; exit 1; }; \
	fi

packer:
	@if [ ! -d "$(PACKER_DIR)" ]; then \
		git clone --depth 1 https://github.com/wbthomason/packer.nvim "$(PACKER_DIR)"; \
	else \
		echo "packer.nvim is already installed: $(PACKER_DIR)"; \
	fi

plugins:
	$(NVIM) --headless +'autocmd User PackerComplete quitall' +'PackerSync'

tools:
	$(NVIM) --headless +'MasonInstall $(MASON_TOOLS)' +'sleep $(MASON_INSTALL_WAIT)' +'qa'

treesitter:
	$(NVIM) --headless +'TSUpdateSync' +'qa'

check: smoke health

smoke:
	$(NVIM) --headless test_contents/test.go +'sleep 2' +'lua local c = vim.lsp.get_clients({ bufnr = 0 }); assert(#c > 0 and c[1].name == "gopls", "gopls is not attached")' +'qa'
	$(NVIM) --headless test_contents/test.js +'sleep 2' +'lua local c = vim.lsp.get_clients({ bufnr = 0 }); assert(#c > 0 and c[1].name == "vtsls", "vtsls is not attached")' +'qa'
	$(NVIM) --headless README.md +'qa'

health:
	$(NVIM) --headless +checkhealth +'write! $(HEALTH_LOG)' +'qa'
	@echo "checkhealth output: $(HEALTH_LOG)"
