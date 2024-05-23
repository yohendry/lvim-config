return function()
	-- vim.opt.fillchars:append('fold:•')
	vim.cmd("set foldlevel=20")

	require("pretty-fold").setup({
		keep_indentation = true,
		fill_char = "-",
		sections = {
			left = {
				"-",
				function()
					return string.rep("*", vim.v.foldlevel)
				end,
				"-<<",
				"content",
				">>-",
			},
			right = {
				"-<< ",
				"number_of_folded_lines",
				": ",
				"percentage",
				" >>---",
			},
		},
	})
end
