local util = require("util")
local dashboard = lvim.builtin.alpha.dashboard.section

dashboard.header.val = util.getBanner

dashboard.buttons.entries[7] = nil -- delete lsdt element aka quit button from the list
-- custom options
table.insert(dashboard.buttons.entries, { "T", "󰏘  Temas", ":Telescope colorscheme<CR>" })
-- keep this at the end
table.insert(dashboard.buttons.entries, { "q", "󰩈  Exit", ":qa!<CR>" })
