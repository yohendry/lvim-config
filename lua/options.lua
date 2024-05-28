-- use relative numbers
vim.wo.relativenumber = true
vim.opt.cursorline = true
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.leader = "space"
--
-- custom options
--
lvim.user = {
	lsp = {
		tsserver = "typescript-tools",
		-- tsserver = true,
		csharp_ls = true,
		biome = true,
		tailwindcss = true,
	},
	tools = {
		eslint = true,
		prettier = true,
	},
}
