return function(_, opts)
	require("nvim-treesitter.configs").setup(opts)

	vim.cmd("set foldmethod=expr")
	vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
end
