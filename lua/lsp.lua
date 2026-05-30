local function map_lsp_keys(event)
	local keymap = vim.keymap.set
	local function opts(desc)
		return { buffer = event.buf, silent = true, desc = desc }
	end

	keymap("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	keymap("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	keymap("n", "gr", vim.lsp.buf.references, opts("Show references"))
	keymap("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	keymap("n", "K", vim.lsp.buf.hover, opts("Show hover documentation"))
	keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	keymap("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts("Previous diagnostic"))
	keymap("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts("Next diagnostic"))
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = map_lsp_keys,
})

local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

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
