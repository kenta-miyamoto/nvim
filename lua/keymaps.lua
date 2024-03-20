local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
vim.g.mapleader = " "
-- local keymap = vim.api.nvim_set_keymap

-- tab関連(https://howpon.com/21914)
keymap("n", "<C-n>", ":tabnext<Return>", opts)
keymap("n", "<C-p>", ":tabprevious<Return>", opts)
keymap("n", "<C-t>", ":tabnew<Return>", opts)
keymap("n", "<C-q>", ":tabclose<Return>",opts)

-- neo tree
keymap("n", "<C-b>", ":Neotree buffers<Return>", opts)
keymap("n", "<C-e>", ":Neotree toggle<Return>", opts)

-- fazzy finder
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.git_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})

-- gitの操作
keymap("n", "<leader>gs", builtin.git_status, {})
keymap("n", "<leader>gl", builtin.git_commits, {})

-- vim keymaps
-- nomal mode
keymap('n', "<C-a>", "gg<S-v>G")
keymap('n', "<C-h>", "<C-w>h")
keymap('n', "<C-j>", "<C-w>j")
keymap('n', "<C-k>", "<C-w>k")
keymap('n', "<C-l>", "<C-w>l")

-- insert mode
keymap('i', 'jj', '<ESC>', opts)
keymap('i', 'っｊ', '<ESC>', opts)
-- keymap('i', '"', '""<Left>', opts)
-- keymap('i', "'", "''<Left>", opts)
-- keymap('i', "{", "{}<Left>", opts)
-- keymap('i', "[", "[]<Left>", opts)
-- keymap('i', "(", "()<Left>", opts)

