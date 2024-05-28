# LunarVim user config
another user nvim user config - this is more stable :)

all the gooodies from lunarvim distro plus configurable lsps and tools

`lsp/options.lua`
```lua
lvim.user = {
	lsp = {
        -- if the server is string it will be skipped and will install a plugin woth that name
		tsserver = "typescript-tools", -- or tsserver = true		csharp_ls = true,
		csharp_ls = true,
		biome = true,
		tailwindcss = true,
	},
	tools = {
		eslint = true,
		prettier = true,
	},
}
```

linters:
- ts = eslint_d, biome

formatter
prettierd, biome, stylua, isort, black

