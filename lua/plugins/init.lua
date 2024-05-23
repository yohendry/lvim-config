local basePlugins = require("plugins.base")
local customPlugins = require("plugins.custom")

local src = {}
vim.list_extend(src, basePlugins)
vim.list_extend(src, customPlugins)

return src
