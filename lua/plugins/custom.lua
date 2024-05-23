return {
  {
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    config = require("plugins.config.trouble"),
  },
  { "dmmulroy/ts-error-translator.nvim", event = "BufRead" },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = require("plugins.config.git-blame"),
  },
  {
    "stevearc/dressing.nvim",
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = require("plugins.config.pretty-fold"),
    event = "BufRead",
  },
  {
    "folke/twilight.nvim",
    opts = require("plugins.opts.twilight"),
  },
  {
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    }
  }
  -- {
  --   "MunifTanjim/eslint.nvim",
  --   event = "LspAttach",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  --   config = function()
  --     local eslint = require("eslint")
  --     eslint.setup({
  --       bin = "eslint_d", -- or `eslint_d`
  --       code_actions = {
  --         enable = true,
  --         apply_on_save = {
  --           enable = true,
  --           types = { "directive", "problem", "suggestion", "layout" },
  --         },
  --         disable_rule_comment = {
  --           enable = true,
  --           location = "separate_line", -- or `same_line`
  --         },
  --       },
  --       diagnostics = {
  --         enable = true,
  --         report_unused_disable_directives = false,
  --         run_on = "type", -- or `save`
  --       },
  --     })
  --   end,
  -- },
}
