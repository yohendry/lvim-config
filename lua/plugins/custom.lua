return {
	{
		"folke/trouble.nvim",
		branch = "dev", -- IMPORTANT!
		config = require("plugins.config.trouble"),
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = require("plugins.config.git-blame"),
	},
	{
		"stevearc/dressing.nvim",
		opts = require("plugins.opts.dressing"),
	},
	{
		"anuvyklack/pretty-fold.nvim",
		config = require("plugins.config.pretty-fold"),
		event = "BufRead",
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"kelly-lin/ranger.nvim",
		config = require("plugins.config.ranger"),
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = require("plugins.config.highlight-colors"),
	},
	{
		"samodostal/image.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "m00qek/baleia.nvim", tag = "v1.4.0", config = true },
		},
		config = require("plugins.config.image"),
	},

	{
		"kosayoda/nvim-lightbulb",
		opts = require("plugins.opts.lightbulb"),
		config = require("plugins.config.lightbulb"),
		event = "LspAttach",
	},
}
