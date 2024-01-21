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
-- key map samples (https://namileriblog.com/mac/neovim_telescope/)
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
-- lsp_definitions
-- keymap("n", "gd", builtin.lsp_definitions, {})
-- gitの操作（git status）
keymap("n", "<leader>gs", builtin.git_status, {})
-- gitの操作（git log）
keymap("n", "<leader>gl", builtin.git_commits, {})

