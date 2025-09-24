local in_zellij = vim.env.ZELLIJ == "0"
return {
  "afonsofrancof/OSC11.nvim",
  enabled = not in_zellij;
  opts = {
    -- Function to call when switching to dark theme
    on_dark = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme catppuccin-mocha")
      vim.cmd("Reactive disable_all")
      vim.cmd("Reactive enable catppuccin-mocha-cursor")
      vim.cmd("Reactive enable catppuccin-mocha-cursorline")
    end,
    -- Function to call when switching to light theme
    on_light = function()
      vim.opt.background = "light"
      vim.cmd("colorscheme catppuccin-latte")
      vim.cmd("Reactive disable_all")
      vim.cmd("Reactive enable catppuccin-latte-cursor")
      vim.cmd("Reactive enable catppuccin-latte-cursorline")
    end,
  }
}
