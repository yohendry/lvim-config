return function(_, opts)
	-- Ensure termguicolors is enabled if not already
	vim.opt.termguicolors = true

	require("nvim-highlight-colors").setup({})
end
