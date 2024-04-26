-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        -- <my custom settings>
        textwidth = 120, -- the maximum column width of a single line
        timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
        undofile = true, -- enable persistent undo
        updatetime = 300, -- faster completion (4000ms default)
        autoread = true, -- automatically reload changed files
        guifont = "CaskaydiaCove Nerd Font,FantasqueSansM Nerd Font,Fira Code Nerd Font,Fira Code NF:h16", -- fonts for GUI clients
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        copilot_no_tab_map = true, -- disable mapping Tab to accept GitHub Copilot suggestions
        copilot_filetypes = {
          markdown = true,
        },
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>be"] = { "<cmd>e!<cr>", desc = "Revert buffer changes" },
        ["<Leader>bh"] = { "<cmd>CDHere<cr>", desc = "CD to the buffer's directory" },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        -- LSPs
        ["<Leader>lz"] = {
          function()
            vim.lsp.codelens.clear()
            if vim.g.codelens_enabled then vim.lsp.codelens.refresh() end
          end,
          desc = "Reload CodeLens",
        },
        ["<Leader>a"] = {
          function()
            local wins = vim.api.nvim_tabpage_list_wins(0)
            if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
              vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
            end
            require("alpha").start(false, require("alpha").default_config)
          end,
          desc = "Home screen",
        },
        ["<Leader>h"] = { ":noh<cr>", desc = "noh" },
        ["<Leader>\\"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
        ["<Leader>-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
      },
      i = {
        ["<Leader>,"] = {
          'copilot#Accept("")',
          desc = "Copilot accept",
          expr = true,
          silent = true,
          noremap = true,
          replace_keycodes = false,
        },
        ["<Leader>，"] = {
          'copilot#Accept("")',
          desc = "Copilot accept",
          expr = true,
          silent = true,
          noremap = true,
          replace_keycodes = false,
        },
      },
      v = {
        p = { '"_dP', desc = "Paste without yanking" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
    commands = {
      CDHere = {
        function() vim.cmd("cd %:p:h") end,
        desc = "CD to the current file's directory"
      }
    },
  },
}
