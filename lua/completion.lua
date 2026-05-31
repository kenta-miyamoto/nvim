-- Completion engine: blink.cmp
-- https://cmp.saghen.dev/
--
-- Pinned to the v1 release line (see lua/plugins.lua), which ships a prebuilt
-- Rust fuzzy-matching binary, so no cargo toolchain is required.
require("blink.cmp").setup({
	-- 'default' (C-y to accept), 'super-tab', 'enter', or 'none'
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		menu = { auto_show = true },
	},

	-- LSP / snippets / path / buffer completion sources
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	-- signature help while typing function arguments (toggle with C-k)
	signature = { enabled = true },

	-- prefer the prebuilt Rust matcher, warn (not error) if it is unavailable
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
