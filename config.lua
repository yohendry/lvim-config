--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

require("options")
require("mappings")

require("plugins.config.core.alpha")
require("plugins.config.core.which-key")
require("plugins.config.core.mason")
require("plugins.config.core.nvimtree")
lvim.plugins = require("plugins")
require("lsp")
