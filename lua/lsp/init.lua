vim.list_extend(
  lvim.lsp.automatic_configuration.skipped_servers,
  { "vimls", "biome", "jsonls", "efm", "eslint", "tsserver" }
)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("tsserver", {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    require("lsp.code_action.eslint_d"),
  },
})

require("lvim.lsp.manager").setup("vimls", opts)
require("lvim.lsp.manager").setup("biome", opts)
-- require("lvim.lsp.manager").setup("eslint", {
--   on_init = function(client)
--     local wk = require("which-key")
--     -- As an example, we will create the following mappings:
--     --  * <leader>ff find files
--     --  * <leader>fr show recent files
--     --  * <leader>fb Foobar
--     -- we'll document:
--     --  * <leader>fn new file
--     --  * <leader>fe edit file
--     -- and hide <leader>1

--     wk.register({
--       F = { ":EslintFixAll<cr>", "EslintFixAll" },
--     }, { prefix = "<leader>l" })
--     print("HEYHEYHEY")

--     client.resolved_capabilities.document_range_formatting = true
--     client.resolved_capabilities.document_formatting = true
--   end,
--   settings = {
--     rulesCustomizations = {
--       { rule = "*", severity = "error" },
--     },
--     validate = true,
--     lintTask = { enable = true },
--     quiet = false,
--     run = "onType",
--     codeActionOnSave = {
--       enable = true,
--       mode = "all",
--     },
--     workingDirectory = { mode = "auto" },
--     codeAction = {
--       disableRuleComment = {
--         enable = true,
--         location = "separateLine",
--       },
--       showDocumentation = {
--         enable = true,
--       },
--     },
--   },
-- })
require("lvim.lsp.manager").setup("jsonls", require("lsp.jsonls"))
require("lvim.lsp.manager").setup("efm", require("lsp.efm"))
