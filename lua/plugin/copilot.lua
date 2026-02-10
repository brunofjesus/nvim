return {
  "zbirenbaum/copilot.lua", -- for providers='copilot'
  cmd = "Copilot",
  opts = {
    suggestion = {
      enabled = true,
--      auto_trigger = false,
--      hide_during_completion = true,
--      debounce = 75,
--      keymap = {
--        accept = "<C-a>",
--        accept_word = false,
--        accept_line = false,
--        next = "<C-l>",
--        prev = "<C-h>",
--        dismiss = "<C-d>",
--      },
    },
    filetypes = {
      markdown = true,
      yaml = true,
    },
    copilot_model = "claude-sonnet-4",
  }
}
