-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check prettier state from saved file
    local state_file = vim.fn.stdpath("data") .. "/prettier_state.json"
    local prettier_enabled = true -- default to enabled

    local file = io.open(state_file, "r")
    if file then
      local content = file:read("*all")
      file:close()
      local ok, state = pcall(vim.json.decode, content)
      if ok and state and state.enabled ~= nil then
        prettier_enabled = state.enabled
      end
    end

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
    }

    -- Only add prettier if it's enabled
    if prettier_enabled then
      table.insert(config.sources, null_ls.builtins.formatting.prettierd)
    end

    return config -- return final config table
  end,
}
