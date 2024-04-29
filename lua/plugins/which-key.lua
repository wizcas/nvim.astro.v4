return {
  "folke/which-key.nvim",
  opts = function(_, config)
    config.triggers_blacklist = {
      -- prevent pressing space to call out which-key in the insert mode,
      -- which is super FUCKING annoying!!!!!
      i = { "j", "k", "<leader>", "<space>" },
      v = { "j", "k" },
    }
    return config
  end,
}
