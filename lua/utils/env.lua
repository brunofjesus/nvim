-- lua/utils/env.lua
-- Centralized environment variable management for Neovim configuration

local M = {}

-- Raw environment variable access
M.raw = {
  zellij = vim.env.ZELLIJ,
  tmux = vim.env.TMUX,
  vimruntime = vim.fn.expand("$VIMRUNTIME"),
  nvim_ai = vim.env.NVIM_AI,
  nvim_php = vim.env.NVIM_PHP,
  opencode_server_url = vim.env.OPENCODE_SERVER_URL,
  opencode_server_password = vim.env.OPENCODE_SERVER_PASSWORD or vim.env.OPENCODE_PASSWORD,
}

-- Computed boolean flags for common checks
M.flags = {
  in_zellij = M.raw.zellij ~= nil,
  in_tmux = M.raw.tmux ~= nil,
  opencode_remote = M.raw.opencode_server_url ~= nil,
}

-- Plugin loading conditions
M.should_load = {
  opencode = M.raw.nvim_ai == "opencode" or M.raw.nvim_ai == nil,
  claudecode = M.raw.nvim_ai == "claudecode",
  zellij_navigator = M.flags.in_zellij,
  tmux_navigator = M.flags.in_tmux,
  php = M.raw.nvim_php ~= nil,
}

-- LSP-specific environment paths
M.lsp = {
  vimruntime_lua = M.raw.vimruntime .. "/lua",
}

return M
