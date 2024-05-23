return {
	{ "folke/neodev.nvim" },
	-- {
	-- 	"folke/neoconf.nvim",
	-- 	lazy = false,
	-- 	command = { "Neoconf" },
	-- 	priority = 1000,
	-- 	opts = require("plugins.opts.neoconf"),
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = require("plugins.opts.catpuccin"),
		config = function(_, opts)
			require("catppuccin").setup(opts)
			lvim.colorscheme = "catppuccin-frappe"
			lvim.builtin.theme.name = "catppuccin"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("plugins.opts.treesitter"),
		config = require("plugins.config.treesitter"),
	},
}
