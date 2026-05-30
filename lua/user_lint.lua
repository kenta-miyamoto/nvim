local lint = require("lint")

lint.linters_by_ft = {
	markdown = { "vale" },
	javascript = { "biomejs" },
	javascriptreact = { "biomejs" },
	typescript = { "biomejs" },
	typescriptreact = { "biomejs" },
	ruby = { "rubocop" },
	go = { "golangcilint" },
}

local function available_linters(names)
	return vim.tbl_filter(function(name)
		local linter = lint.linters[name]
		if linter == nil then
			return false
		end

		local cmd = type(linter.cmd) == "function" and linter.cmd() or linter.cmd
		return vim.fn.executable(cmd) == 1
	end, names)
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("user-lint", { clear = true }),
	callback = function()
		local linters = available_linters(lint.linters_by_ft[vim.bo.filetype] or {})
		if #linters > 0 then
			lint.try_lint(linters)
		end
	end,
})
