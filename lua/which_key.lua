local ok, which_key = pcall(require, "which-key")
if not ok then
	return
end

which_key.setup({
	preset = "modern",
	delay = 500,
})

which_key.add({
	{ "<leader>g", group = "git" },
	{ "<leader>c", group = "code" },
})
