require("options")
require("plugins")
require("keymaps")

-- https://github.com/nvim-lualine/lualine.nvim
require("lualine").setup({
	options = {
		theme = "gruvbox",
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
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

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
})
require("neo-tree").setup()

-- im-select
require("im_select").setup({
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
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
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
	yadm = {
		enable = false,
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

-- https://github.com/williamboman/mason.nvim
require("mason").setup()

-- https://github.com/mhartington/formatter.nvim
local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end,
		},
    vue = { require("formatter.filetypes.vue").prettier },
		json = { require("formatter.filetypes.json").jq },
		ruby = { require("formatter.filetypes.ruby").rubocop },
		lua = { require("formatter.filetypes.lua").stylua },
		go = { require("formatter.filetypes.go").golines },
		sql = {
			function()
				return {
					exe = "sql-formatter",
					args = {},
					stdin = true,
				}
			end,
		},
	},
})

-- https://github.com/mfussenegger/nvim-lint
require("lint").linters_by_ft = {
	markdown = { "vale" },
  vue = { "eslint_d" },
	javascript = { "biomejs" },
	ruby = { "rubocop" },
	go = { "golangcilint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

require("Comment").setup()

vim.cmd([[colorscheme kanagawa-wave]])
vim.cmd([[language en_US.UTF-8]])
