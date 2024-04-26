if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

if vim.g.neovide then
  local neovide_opts = {
    neovide_floating_blur_amount_x = 4.0,
    neovide_floating_blur_amount_y = 4.0,
    neovide_remember_window_size = true,
    neovide_cursor_vfx_mode = "pixiedust",
    neovide_cursor_vfx_partical_density = 32.0,
    neovide_theme = "auto",
    neovide_fullscreen = true,
  }
  for k, v in pairs(neovide_opts) do
    vim.g[k] = v
  end
end

-- Powershell support for Windows
if vim.fn.has "win32" then
  vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
  vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.g.noshellslash = true
end
