return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function (_, opts)
      local dapgo = require("dap-go")
      dapgo.setup(opts)

      local keymap = vim.keymap

      local o = { noremap = true, silent = true }
      o.desc = "Debug Test"
      keymap.set("n", "<leader>dgt", function() require("dap-go").debug_test() end, o)
      o.desc = "Debug Last Test"
      keymap.set("n", "<leader>dgl", function() require("dap-go").debug_last() end, o)

  end
}
