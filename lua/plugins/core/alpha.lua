local util = require("util")
local insert = table.insert
local dashboard = lvim.builtin.alpha.dashboard.section

-- setting up header
dashboard.header.val = util.header

-- setting up my buttons
local buttons = {}
-- custom options
-- check if has ranger insrtalled to add the open option
if util.module_exist("ranger-nvim") then
	insert(buttons, {
		"o",
		" Open",
		"<cmd>lua require('ranger-nvim').open(true)<cr>",
	})
end
insert(buttons, {
	"n",
	" New file",
	"<cmd>e %:h/filename<cr>",
})

insert(buttons, {
	"f",
	"󰱽 Find files",
	"<cmd>Telescope find_files<cr>",
})

insert(buttons, {
	"r",
	"󰑖 Recent files",
	"<cmd>Telescope oldfiles<cr>",
})

if util.module_exist("project_nvim") then -- check if has project insrtalled to add the open option
	insert(buttons, {
		"p",
		"󱝪 Projects",
		"<cmd>Telescope projects<cr>",
	})
end

insert(buttons, { "c", " Coniguration", "<cmd>e $LUNARVIM_CONFIG_DIR/config.lua<cr>" })
--[[ insert(buttons, { "T", "󰏘 Temas", ":Telescope colorscheme<CR>" }) ]]
insert(buttons, { "q", "󰩈 Exit", ":qa!<CR>" })

dashboard.buttons.entries = buttons

-- dashboard.footer.type = "table"
dashboard.footer.val = { "  Yohendry Hurtado", "󱃷  LunarVIM" }
-- lvim.builtin.telescope.setup()
