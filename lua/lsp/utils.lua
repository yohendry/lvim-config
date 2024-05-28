local util = require("util")
local M = {}

M.get_configured_servers = function(mandatory, optional, user_lsp_options)
	local servers_not_found = {} -- stores servers with no configs
	local servers_found = vim.tbl_keys(mandatory) -- stores servers with configs
	local plugins_not_found = {}

	local servers_user_want_to_activate = {} -- stores user selected servers and config { servername = config }

	-- copy user selected servers config from optional to manadatory
	for user_option, activate in pairs(user_lsp_options) do
		local is_string = type(activate) == "string"
		local is_boolean = type(activate) == "boolean"
		if is_boolean and activate then
			servers_user_want_to_activate[user_option] = { lsp = true }
		elseif is_string then
			servers_user_want_to_activate[user_option] = { lsp = false, plugin = activate }
		end
	end

	-- add mandatory servers to the user selected list
	-- vim.tbl_extend("force", servers_user_want_to_activate, vim.tbl_keys(mandatory))

	-- configure list of servers
	for server, opts in pairs(servers_user_want_to_activate) do
		if opts.lsp then -- check if is a lsp setup
			local config = optional[server]

			if config then
				mandatory[server] = config
				table.insert(servers_found, server)
			else
				table.insert(servers_not_found, server)
			end
		elseif opts.plugin then -- check if is a plugin install
			local plugin_is_installed = util.module_exist(opts.plugin)

			if plugin_is_installed then
				table.insert(servers_found, server)
			else
				table.insert(plugins_not_found, opts.plugin)
			end
		end
	end

	-- display recomendations for u snconfigured servers
	if vim.tbl_count(servers_not_found) > 1 then
		print("no server configuration found the following servers:")
		for _, server in ipairs(servers_not_found) do
			print(" - " .. server)
		end
		print("please add this optional_servers table in `lua/lsp/init.lua` configuration")
		for _, server in ipairs(servers_not_found) do
			print(server .. " = opts,")
		end
	end
	if vim.tbl_count(plugins_not_found) > 1 then
		print("The following plugins are missing:")
		for _, server in ipairs(plugins_not_found) do
			print(" - " .. server)
		end
	end

	return mandatory, servers_found
end

M.update_alpha_footer = function(servers)
	local icons = {
		tsserver = "󰛦 󰌞 󰌝 󰌜    ",
		tailwindcss = "󱏿 ",
		pyrigth = " ",
		csharp_ls = " ",
	}

	local footer_append = " "

	for server, icon in pairs(icons) do
		if vim.tbl_contains(servers, server) then
			footer_append = footer_append .. icon
		end
	end

	local dashboard = lvim.builtin.alpha.dashboard.section
	table.insert(dashboard.footer.val, "")
	table.insert(dashboard.footer.val, footer_append)
end

return M
