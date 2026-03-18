local env = require("utils.env")
return {
  "afonsofrancof/OSC11.nvim",
  enabled = env.should_load.osc11;
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
