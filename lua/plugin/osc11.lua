local env = require("utils.env")
return {
  "afonsofrancof/OSC11.nvim",
  enabled = env.should_load.osc11,
  opts = {
    on_dark = function()
      vim.cmd("EnableDarkMode")
    end,
    on_light = function()
      vim.cmd("DisableDarkMode")
    end,
  },
  config = function(_, opts)
    require("osc11").setup(opts)
    vim.defer_fn(function()
      io.stdout:write("\027]11;?\007")
      io.stdout:flush()
    end, 100)
  end,
}
