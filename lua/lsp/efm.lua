local eslint = require("efmls-configs.linters.eslint_d")
local prettier = require("efmls-configs.formatters.prettier_d")
local stylua = require("efmls-configs.formatters.stylua")

eslint.rootMarkers = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.mjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
  "eslint.config.cts",
}

local languages = {
  typescript = { eslint, prettier },
  typescriptreact = { eslint, prettier },
  lua = { stylua },
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = languages,
  },
}
