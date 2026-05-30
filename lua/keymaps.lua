local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
vim.g.mapleader = " "
-- local keymap = vim.api.nvim_set_keymap

-- tab関連(https://howpon.com/21914)
keymap("n", "<C-n>", ":tabnext<Return>", vim.tbl_extend("force", opts, { desc = "Next tab" }))
keymap("n", "<C-p>", ":tabprevious<Return>", vim.tbl_extend("force", opts, { desc = "Previous tab" }))
keymap("n", "<C-t>", ":tabnew<Return>", vim.tbl_extend("force", opts, { desc = "New tab" }))
keymap("n", "<C-q>", ":tabclose<Return>", vim.tbl_extend("force", opts, { desc = "Close tab" }))

-- neo tree
keymap("n", "<C-b>", ":Neotree buffers<Return>", vim.tbl_extend("force", opts, { desc = "Open buffer sidebar" }))
keymap("n", "<C-e>", ":Neotree toggle<Return>", vim.tbl_extend("force", opts, { desc = "Toggle file sidebar" }))

-- fazzy finder
local builtin = require("telescope.builtin")
keymap("n", "<C-f>", builtin.git_files, { desc = "Find Git files" })
keymap("n", "<C-g>", builtin.live_grep, { desc = "Live grep" })
keymap("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
keymap("n", "<leader>gl", builtin.git_commits, { desc = "Git log" })

-- vim keymaps
-- nomal mode
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap("n", "gh", "<C-w>h", { desc = "Move to left window" })
keymap("n", "gj", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "gk", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "gl", "<C-w>l", { desc = "Move to right window" })
keymap("n", "x", '"_x', opts) -- delete without yank
keymap("n", ";", ":", opts)

keymap("n", "<C-,>", "<C-w>>") -- ウィンドウの横幅を少し広げる
keymap("n", "<C-.>", "<C-w>+") -- ウィンドウの縦幅を少し広げる
keymap("n", "<C-<>", "<C-w><") -- ウィンドウの横幅を少し狭める
keymap("n", "<C->>", "<C-w>-") -- ウィンドウの縦幅を少し狭める

-- insert mode
keymap("i", "jj", "<ESC>", opts)
keymap("i", "っｊ", "<ESC>", opts)
-- keymap('i', '"', '""<Left>', opts)
-- keymap('i', "'", "''<Left>", opts)
-- keymap('i', "{", "{}<Left>", opts)
-- keymap('i', "[", "[]<Left>", opts)
-- keymap('i', "(", "()<Left>", opts)
