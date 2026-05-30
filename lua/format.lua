local function prettier()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			"--single-quote",
		},
		stdin = true,
	}
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = { prettier },
		javascriptreact = { prettier },
		typescript = { prettier },
		typescriptreact = { prettier },
		vue = { prettier },
		markdown = { prettier },
		json = { require("formatter.filetypes.json").jq },
		ruby = { require("formatter.filetypes.ruby").rubocop },
		lua = { require("formatter.filetypes.lua").stylua },
		go = { require("formatter.filetypes.go").golines },
		rust = { require("formatter.filetypes.rust").rustfmt },
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
