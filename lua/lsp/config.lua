-- disable automatic installs
lvim.lsp.automatic_servers_installation = false
-- utils and modules
local util = require("util")
local manager = require("lvim.lsp.manager")
local lsp_util = require("lsp.utils")
local formatters_manager = require("lvim.lsp.null-ls.formatters")
local null_ls_helper = require("null-ls.helpers")

local setup, null_ls = util.module_exist("null-ls")

if not setup then -- if ther is no null-ls do nothing
	return
end

-- global vars
local capabilities = vim.lsp.protocol.make_client_capabilities()
local opts = { capabilities = capabilities }
local extend = vim.list_extend
local user_options = lvim.user
local format_approved_servers = { "null-ls" }

-- SETUP LSP SERVERS --

local mandatory_servers = {
	jsonls = extend(require("lsp.jsonls"), opts),
	vimls = opts,
	pyrigth = {},
	marksman = {},
}

local optional_servers = {
	tsserver = extend(require("lsp.tsserver"), opts),
	tailwindcss = opts,
	biome = opts,
	csharp_ls = opts,
}

local servers_to_setup, configured_list =
	lsp_util.get_configured_servers(mandatory_servers, optional_servers, user_options.lsp)

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, configured_list)

for server, config in pairs(servers_to_setup) do
	manager.setup(server, config)
end

--
-- SETUP NONE-LS TOOLS
--
local sources = {
	null_ls.builtins.completion.tags,
	null_ls.builtins.hover.printenv,
}

if user_options.tools.prettier then
	table.insert(sources, require("lsp.formatter.prettier"))
end

if user_options.tools.eslint then
	table.insert(sources, require("lsp.code_action.eslint_d"))
	table.insert(
		sources,
		null_ls.builtins.diagnostics.eslint_d.with({
			runtime_condition = null_ls_helper.cache.by_bufnr(function(params)
				return util.cosmiconfig("eslint", "eslintConfig")(params.bufname)
			end),
		})
	)
end

if user_options.lsp.biome then
	table.insert(sources, require("lsp.formatter.biome"))
end

null_ls.setup({
	sources = sources,
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- only use null-ls for formatting instead of lsp server
							return vim.tbl_contains(format_approved_servers, client.name)
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
-- SEUPT REST OF FORMATTERS/LINTERS
formatters_manager.setup({ { name = "stylua" }, { name = "black" } })
-- UPDATE ALPHA FOOTHER
lsp_util.update_alpha_footer(configured_list)
