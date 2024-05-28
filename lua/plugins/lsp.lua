local tsserver_map = {
	["typescript-tools"] = {
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = require("plugins.config.typescript-tools"),
	},
}

local plugins = {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = require("plugins.opts.ts-autotags"),
	},
}

local user_options = lvim.user

if user_options.lsp.tsserver then -- checl if add tssserver
	table.insert(plugins, { "dmmulroy/ts-error-translator.nvim", event = "LspAttach" })

	if type(user_options.lsp.tsserver) == "string" then
		local plugin = tsserver_map[user_options.lsp.tsserver]

		if plugin then
			table.insert(plugins, plugin)
		end
	end
end

if user_options.lsp.tailwindcss then -- checl if add tssserver
	table.insert(plugins, {
		"laytan/tailwind-sorter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
		build = "cd formatter && npm ci && npm run build",
		config = true,
	})
end

return plugins
