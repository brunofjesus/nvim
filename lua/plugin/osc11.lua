local in_zellij = vim.env.ZELLIJ == "0"
return {
  "afonsofrancof/OSC11.nvim",
  enabled = not in_zellij;
  opts = {
    -- Function to call when switching to dark theme
    on_dark = function()
      vim.cmd("EnableDarkMode")
    end,
    -- Function to call when switching to light theme
    on_light = function()
      vim.cmd("DisableDarkMode")
    end,
  }
}
