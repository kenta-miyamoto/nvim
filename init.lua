require("options")
-- Install + load all plugins via the built-in vim.pack (Neovim 0.12).
require("plugins")

require("keymaps")

-- Completion is set up before LSP so its capabilities can be shared with servers.
require("completion")

-- https://github.com/mason-org/mason.nvim
require("mason").setup()
require("lsp")

require("format")
require("user_lint")

-- https://github.com/nvim-lualine/lualine.nvim
require("lualine").setup({
	options = {
		theme = "gruvbox",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		-- lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_b = {
			{ "branch" },
			{
				"diff",
				symbols = { added = "added  ", modified = "modified  ", removed = "removed  " },
			},
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
-- require("scope").setup({})

require("mini.indentscope").setup({ symbol = "▏", delay = 0 })
require("ibl").setup({
	debounce = 100,
	indent = { char = "|" },
	whitespace = { highlight = { "Whitespace", "Folded" }, remove_blankline_trail = true },
	scope = { exclude = { language = { "" } } },
})

-- https://github.com/nvim-treesitter/nvim-treesitter (main branch: Neovim 0.11+ API)
-- The rewrite removed `nvim-treesitter.configs` / `ensure_installed` / `highlight`.
-- Parsers are installed via `install()` (a no-op if already present) and
-- highlighting is started per buffer with `vim.treesitter.start()`.
require("nvim-treesitter").install({
	"go",
	"javascript",
	"typescript",
	"tsx",
	"vue",
	"markdown",
	"markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
	pattern = {
		"go",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"markdown",
	},
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- im-select
require("im_select").setup({
	default_command = "im-select",
	default_im_select = "com.apple.keylayout.ABC",
})

require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

require("telescope").setup({
	defaults = {
		-- preview config
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 0.2,
			width = 0.4,
			prompt_position = "bottom",
		},
		vimgrep_arguments = {
			-- ripggrepコマンドのオプション
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
	},
})

-- file tree (neo-tree + window-picker)
require("filetree")

require("Comment").setup()
vim.cmd([[colorscheme kanagawa-wave]])
vim.cmd([[language en_US.UTF-8]])
