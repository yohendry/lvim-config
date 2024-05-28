local custom = {
	layout_strategy = "horizontal",
	prompt_prefix = "   ",
	selection_caret = "   ",
	layout_config = {
		width = { 0.8, min = 180 },
		height = 0.8,
		prompt_position = "top",
	},
	file_ignore_patterns = { ".git", "node_modules" },
}

lvim.builtin.telescope.defaults = vim.tbl_extend("force", lvim.builtin.telescope.defaults, custom)
