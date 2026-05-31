-- Plugin management via Neovim 0.12's built-in plugin manager.
-- https://neovim.io/doc/user/pack.html
--
-- Plugins are installed under `stdpath('data')/site/pack/core/opt` and are
-- usable immediately after this `add()` call. Per-plugin setup() lives in the
-- modules required from init.lua (lsp / completion / filetree / etc.).
vim.pack.add({
	-- color schemes
	-- refs https://vimcolorschemes.com/top/
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/tomasr/molokai" },
	{ src = "https://github.com/scottmckendry/cyberdream.nvim" },
	{ src = "https://github.com/NLKNguyen/papercolor-theme" },

	-- im-select (switch macOS input source automatically)
	{ src = "https://github.com/keaising/im-select.nvim" },

	-- status line + icons
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- indent guides
	{ src = "https://github.com/echasnovski/mini.indentscope" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

	-- syntax highlighting (nvim-treesitter main branch)
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/digitaltoad/vim-pug" },
	{ src = "https://github.com/posva/vim-vue" },

	-- git
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },

	-- fuzzy finder
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.2" },

	-- file tree (+ dependencies)
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/s1n7ax/nvim-window-picker", version = vim.version.range("2") },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },

	-- LSP (native vim.lsp.config / vim.lsp.enable, managed by mason)
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	-- completion engine (Rust-based; release tag ships a prebuilt binary)
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },

	-- lint / format
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/mhartington/formatter.nvim" },

	-- comment toggling
	{ src = "https://github.com/numToStr/Comment.nvim" },
})
