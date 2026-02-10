if vim.g.neovide then
  vim.g.neovide_remember_window_size = true

  vim.g.gui_font_default_size = 12
  vim.g.gui_font_size = vim.g.gui_font_default_size

  vim.g.gui_font_face = "JetBrainsMono Nerd Font"
  RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
  end
  ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
  end
  ResetGuiFont = function ()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
  end
  -- Call function on startup to set default value
  ResetGuiFont()
  -- Keymaps
  local opts = { noremap = true, silent = true }
  vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
  vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
  vim.keymap.set({'n', 'i'}, "<C-BS>", function() ResetGuiFont() end, opts)

  -- Terminal colors
  vim.opt.termguicolors = true
  -- Terminal cattpuccin mocha (TODO: adapt to other variants)
  vim.g.terminal_color_0 = "#45475a"
  vim.g.terminal_color_1 = "#f38ba8"
  vim.g.terminal_color_2 = "#a6e3a1"
  vim.g.terminal_color_3 = "#f9e2af"
  vim.g.terminal_color_4 = "#89b4fa"
  vim.g.terminal_color_5 = "#f5c2e7"
  vim.g.terminal_color_6 = "#94e2d5"
  vim.g.terminal_color_7 = "#bac2de"
  vim.g.terminal_color_8 = "#585b70"
  vim.g.terminal_color_9 = "#f38ba8"
  vim.g.terminal_color_10 = "#a6e3a1"
  vim.g.terminal_color_11 = "#f9e2af"
  vim.g.terminal_color_12 = "#89b4fa"
  vim.g.terminal_color_13 = "#f5c2e7"
  vim.g.terminal_color_14 = "#94e2d5"
  vim.g.terminal_color_15 = "#a6adc8"
end
