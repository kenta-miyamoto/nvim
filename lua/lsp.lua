-- LSP configuration using Neovim 0.11+ native API (vim.lsp.config / vim.lsp.enable).
-- Servers are installed/managed by mason + mason-lspconfig.

-- Keymaps are attached per buffer when a language server connects.
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

-- Share blink.cmp's completion capabilities with every language server.
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
	vim.lsp.config("*", { capabilities = blink.get_lsp_capabilities() })
end

-- Vue support: vtsls hosts the @vue/typescript-plugin, vue_ls handles .vue files.
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

-- lua_ls: teach it about the Neovim runtime and the `vim` global.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

local servers = { "lua_ls", "gopls", "rust_analyzer", "vtsls", "vue_ls", "ruby_lsp" }

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
	pcall(mason_lspconfig.setup, {
		ensure_installed = servers,
		automatic_enable = servers,
	})
end

vim.lsp.enable(servers)
