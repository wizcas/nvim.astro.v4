return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  config = function()
    -- Optional: Configure markdown preview settings
    vim.g.mkdp_auto_start = 0 -- Don't auto-start preview when entering markdown buffer
    vim.g.mkdp_auto_close = 1 -- Auto-close preview when leaving markdown buffer
    vim.g.mkdp_refresh_slow = 0 -- Auto-refresh as you edit (0) or only on save/leave insert mode (1)
    vim.g.mkdp_command_for_global = 0 -- Only enable for markdown files
    vim.g.mkdp_open_to_the_world = 0 -- Only accessible from localhost
    vim.g.mkdp_open_ip = '' -- Use default IP
    vim.g.mkdp_browser = '' -- Use system default browser
    vim.g.mkdp_echo_preview_url = 0 -- Don't echo preview URL
    vim.g.mkdp_browserfunc = '' -- Use default browser function
    vim.g.mkdp_theme = 'dark' -- Set theme (dark or light)
    vim.g.mkdp_combine_preview = 0 -- Don't combine preview windows
    vim.g.mkdp_combine_preview_auto_refresh = 1 -- Auto-refresh combined preview
    
    -- Preview options
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = 'middle',
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
      content_editable = false,
      disable_filename = 0,
      toc = {}
    }
    
    -- Custom CSS (optional)
    vim.g.mkdp_markdown_css = ''
    vim.g.mkdp_highlight_css = ''
    
    -- Custom port (optional, empty for random)
    vim.g.mkdp_port = ''
    
    -- Page title template
    vim.g.mkdp_page_title = '「${name}」'
  end,
}
