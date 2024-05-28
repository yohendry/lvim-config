local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local util = require("util")

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

local get_root = h.cache.by_bufnr(function(params)
	local root = util.cosmiconfig("prettier", "prettier")(params.bufname)
	vim.print(root)
	return root
end)

return h.make_builtin({
	name = "prettier",
	meta = {
		url = "https://github.com/prettier/prettier",
		description = [[Prettier is an opinionated code formatter. It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary.]],
		notes = {
			[[[TOML](https://github.com/bd82/toml-tools/tree/master/packages/prettier-plugin-toml) via plugins. These filetypes are not enabled by default, but you can follow the instructions [here](BUILTIN_CONFIG.md#filetypes) to define your own list of filetypes.]],
			[[To increase speed, you may want to try [prettierd](https://github.com/fsouza/prettierd). You can also set up [eslint-plugin-prettier](https://github.com/prettier/eslint-plugin-prettier) and format via [eslint_d](https://github.com/mantoni/eslint_d.js/).]],
		},
	},
	method = { FORMATTING, RANGE_FORMATTING },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"css",
		"scss",
		"less",
		"html",
		"yaml",
		"markdown",
		"markdown.mdx",
		"graphql",
		"handlebars",
		"svelte",
		"astro",
	},
	generator_opts = {
		command = "prettierd",
		args = h.range_formatting_args_factory({
			"--stdin-filepath",
			"$FILENAME",
		}, "--range-start", "--range-end", { row_offset = -1, col_offset = -1 }),
		to_stdin = true,
		dynamic_command = cmd_resolver.from_node_modules(),
		cwd = get_root,
	},
	factory = h.formatter_factory,
	runtime_condition = get_root,
})
