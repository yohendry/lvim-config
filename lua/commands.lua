vim.api.nvim_create_user_command('HardReload', function()
    local commands = {
      "LvimCacheReset",
      "LvimSyncCorePlugins",
      "packloadall",
      "LvimReload",
      "qa!"
    }

    for _, command in ipairs(commands) do
      vim.cmd(command)
    end
  end,
  {})
