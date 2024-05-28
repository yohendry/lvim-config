-- prevent yank on paste
vim.keymap.set("x", "p", "P", { silent = true })

-- replace selected text with confirmation
-- vim.cmd('vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>')
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- quick save
lvim.keys.visual_mode["<C-r>"] = '"hy:%s/<C-r>h//gc<left><left><left>' -- replace
lvim.keys.normal_mode["<C-c>"] = ":%y+<cr>" -- copy all
lvim.keys.normal_mode["<C-a>"] = "ggVG<cr>" -- select all

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":qa!<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.keys.normal_mode["<leader>q"] = ":qa!<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

local search_mappings = lvim.builtin.which_key.mappings["s"]

lvim.builtin.which_key.mappings["s"] = vim.tbl_extend(
	"force",
	search_mappings,
	{ b = { "<cmd>Telescope buffers<CR>", "Buffers" }, p = { "<cmd>Telescope projects<cr>", "Projects" } }
)
