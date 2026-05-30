local function map_lsp_keys(event)
	local opts = { buffer = event.buf, silent = true }
	local keymap = vim.keymap.set

	keymap("n", "gd", vim.lsp.buf.definition, opts)
	keymap("n", "gD", vim.lsp.buf.declaration, opts)
	keymap("n", "gr", vim.lsp.buf.references, opts)
	keymap("n", "gi", vim.lsp.buf.implementation, opts)
	keymap("n", "K", vim.lsp.buf.hover, opts)
	keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap("n", "]d", vim.diagnostic.goto_next, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = map_lsp_keys,
})

local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_language_server_path,
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

local servers = { "gopls", "vtsls", "vue_ls" }

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
	pcall(mason_lspconfig.setup, {
		ensure_installed = servers,
		automatic_enable = servers,
	})
end

if vim.lsp.enable ~= nil then
	vim.lsp.enable(servers)
end
