return {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { 
    "mfussenegger/nvim-dap", -- required
    "nvim-neotest/nvim-nio", -- required
  },
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function ()
        vim.notify("Debug session ended. Run DapUiClose to go back to normal view...", vim.log.levels.INFO)
      end
      dap.listeners.after.event_exited["dapui_config"] = function ()
        vim.notify("Debug session exited. Run DapUiClose to go back to normal view...", vim.log.levels.INFO)
      end

      vim.api.nvim_create_user_command('DapUiClose', function() require("dapui").close() end, { desc = "Close DapUI" })
      vim.api.nvim_create_user_command('DapUiOpen', function() require("dapui").open() end, { desc = "Open DapUI" })
      vim.keymap.set("n", "<leader>dut", function() require("dapui").toggle() end, { desc = "DAP UI Toggle"}) 
    end

  }
