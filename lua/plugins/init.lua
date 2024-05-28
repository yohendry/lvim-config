local base_plugins = require("plugins.base")
local custom_plugins = require("plugins.custom")
local lsp_plugins = require("plugins.lsp")

local src = {}
vim.list_extend(src, base_plugins)
vim.list_extend(src, custom_plugins)
vim.list_extend(src, lsp_plugins)

return src
