-- Notify every embedded :terminal buffer that the color scheme changed, using
-- the DECSET mode 2031 "color scheme update" report (CSI ?997;Ps n).
--
-- Why: programs running inside Neovim's :terminal (e.g. opencode via
-- snacks.terminal) subscribe to mode 2031 and treat CSI ?997;1n / ?997;2n as
-- a prompt to re-query OSC 10/11 themselves — they don't react to an
-- unsolicited OSC 11 report directly. Real terminals (foot) and tmux (with
-- allow-passthrough) deliver this notification live when the system theme
-- changes, which is why opencode updates automatically there. Neovim's
-- libvterm never generates or forwards it, so embedded opencode never learns
-- to re-check. We compensate by sending the same notification ourselves;
-- opencode's follow-up OSC 10/11 query then lands on libvterm and gets
-- answered correctly from the just-applied colorscheme.
---@param is_dark boolean
local function broadcast_colorscheme_change_to_terminals(is_dark)
  local sequence = string.format("\027[?997;%dn", is_dark and 1 or 2)

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "terminal" then
      local ok, job_id = pcall(vim.api.nvim_buf_get_var, buf, "terminal_job_id")
      if ok and job_id then
        vim.fn.chansend(job_id, sequence)
      end
    end
  end
end

vim.api.nvim_create_user_command(
  'EnableDarkMode',
  function ()
      vim.opt.background = "dark"
      vim.cmd("colorscheme catppuccin-frappe")
      vim.cmd("Reactive disable_all")
      vim.cmd("Reactive enable catppuccin-frappe-cursor")
      vim.cmd("Reactive enable catppuccin-frappe-cursorline")
      broadcast_colorscheme_change_to_terminals(true)
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
      broadcast_colorscheme_change_to_terminals(false)
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
