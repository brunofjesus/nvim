return {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function ()
        vim.notify("Debug session ended. Press Enter to close UI...", vim.log.levels.INFO)
        vim.fn.input("Press Enter to continue...")
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function ()
        vim.notify("Debug session exited. Press Enter to close UI...", vim.log.levels.INFO)
        vim.fn.input("Press Enter to continue...")
        dapui.close()
      end
    end
  }
