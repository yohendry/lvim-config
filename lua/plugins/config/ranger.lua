return function()
	require("ranger-nvim").setup({ replace_netrw = true })

	require("which-key").register({
		o = {
			function()
				require("ranger-nvim").open(true)
			end,
			"Open",
		},
	}, { prefix = "<leader>" })
end
