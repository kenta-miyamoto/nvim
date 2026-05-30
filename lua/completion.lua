local ok, blink = pcall(require, "blink.cmp")
if not ok then
	return
end

blink.setup({
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 300,
		},
	},
	signature = {
		enabled = true,
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})
