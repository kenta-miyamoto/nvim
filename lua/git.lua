local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", vim.tbl_extend("force", opts, { desc = "Open Git diff view" }))
keymap(
	"n",
	"<leader>gD",
	"<cmd>DiffviewOpen origin/HEAD...HEAD<CR>",
	vim.tbl_extend("force", opts, { desc = "Open diff against origin/HEAD" })
)
keymap(
	"n",
	"<leader>gh",
	"<cmd>DiffviewFileHistory %<CR>",
	vim.tbl_extend("force", opts, { desc = "Open file history" })
)
keymap("n", "<leader>gq", "<cmd>DiffviewClose<CR>", vim.tbl_extend("force", opts, { desc = "Close Git diff view" }))
