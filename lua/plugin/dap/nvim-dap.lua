return {
    "mfussenegger/nvim-dap",
    config = function()
      local keymap = vim.keymap

      local opts = { noremap = true, silent = true }

      opts.desc = "DAP Continue"
      keymap.set('n', '<F5>', function() require('dap').continue() end, opts)

      opts.desc = "DAP Step Over"
      keymap.set('n', '<F2>', function() require('dap').step_over() end, opts)

      opts.desc = "DAP Step Into"
      keymap.set('n', '<F3>', function() require('dap').step_into() end, opts)

      opts.desc = "DAP Step Out"
      keymap.set('n', '<F4>', function() require('dap').step_out() end, opts)

      opts.desc = "DAP Run To Cursor"
      keymap.set('n', '<F8>', function() require('dap').run_to_cursor() end, opts)

      opts.desc = "DAP Terminate"
      keymap.set('n', '<F10>', function() require('dap').terminate() end, opts)

      opts.desc = "DAP Toggle Breakpoint"
      keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, opts)

      opts.desc = "DAP Set Breakpoint"
      keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, opts)

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
      sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
      sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
    end,
}
