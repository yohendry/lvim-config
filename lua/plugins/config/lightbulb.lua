return function(_, opts)
  require("nvim-lightbulb").setup(opts)
  -- paint lightbulb yellow
  local hls = { "LightBulbSign", "LightBulbVirtualText", "LightBulbFloatWin", "LightBulbVirtualText" }
  for _, hlGroup in ipairs(hls) do
    vim.api.nvim_set_hl(0, hlGroup, { fg = "#ffffee", bold = false })
  end
end
