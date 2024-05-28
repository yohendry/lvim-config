return function(_, opts)
  local conform = require("conform")

  lvim.format_on_save.enabled = false

  local formatters = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
  }


  local a = {
    javascript = {},
    typescript = {},
    javascriptreact = {},
    typescriptreact = {},
    svelte = {},
    css = {},
    html = {},
    json = {},
    yaml = {},
    markdown = {},
    graphql = {},

  }
  -- if lvim.user.lsp.eslint_prettier or lvim.user.lsp.biome then
  local file_types_biome = { "javascript", "javascriptreact", "typescript", "typescriptreact", "javascript.tsx",
    "typescript.tsx", "jso", "jsonc" }
  local file_types_prettier = { "svelte", "css", "html", "json", "yaml", "markdown", "markdown.mdx", "graphql" }


  for _, ft in ipairs(file_types_biome) do
    table.insert(formatters, { [ft] = { { "prettierd", "biome" } } })
  end

  for _, ft in ipairs(file_types_prettier) do
    table.insert(formatters, { [ft] = { { "prettierd" } } })
  end


  -- end
  vim.tbl_extend("force", opts, { formatters_by_ft = formatters })
  conform.setup(opts)










  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      vim.print("test")
      conform.format({ bufnr = args.buf })
    end,
  })

  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

  vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    conform.format({ async = true, lsp_fallback = true, range = range })
  end, { range = true })

  -- rewrite which-key format binding
end
