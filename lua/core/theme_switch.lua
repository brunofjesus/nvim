vim.api.nvim_create_user_command(
  'EnableDarkMode',
  function ()
      vim.opt.background = "dark"
      vim.cmd("colorscheme catppuccin-frappe")
      vim.cmd("Reactive disable_all")
      vim.cmd("Reactive enable catppuccin-frappe-cursor")
      vim.cmd("Reactive enable catppuccin-frappe-cursorline")
  end,
  {}
)

vim.api.nvim_create_user_command(
  'DisableDarkMode',
  function ()
      vim.opt.background = "light"
      vim.cmd("colorscheme catppuccin-latte")
      vim.cmd("Reactive disable_all")
      vim.cmd("Reactive enable catppuccin-latte-cursor")
      vim.cmd("Reactive enable catppuccin-latte-cursorline")
  end,
  {}
)

vim.api.nvim_create_user_command(
  'ToggleDarkMode',
  function ()
      if vim.opt.background == "dark" then
          vim.cmd("DisableDarkMode")
      else
          vim.cmd("EnableDarkMode")
      end
  end,
  {}
)
