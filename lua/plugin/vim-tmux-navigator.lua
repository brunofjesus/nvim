local env = require("utils.env")
return {
  "christoomey/vim-tmux-navigator",
  enabled = env.should_load.tmux_navigator;
  lazy = true,
  event = "VeryLazy",
  init = function()
    -- disable default mappings; we define our own below
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true, desc = "navigate right" } },
  },
}
