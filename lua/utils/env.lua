-- lua/utils/env.lua
-- Centralized environment variable management for Neovim configuration

local M = {}

-- Raw environment variable access
M.raw = {
  zellij = vim.env.ZELLIJ,
  vimruntime = vim.fn.expand("$VIMRUNTIME"),
  nvim_ai = os.getenv("NVIM_AI"),
}

-- Computed boolean flags for common checks
M.flags = {
  in_zellij = M.raw.zellij ~= nil,
}

-- Plugin loading conditions
M.should_load = {
  opencode = M.raw.nvim_ai == "opencode" or M.raw.nvim_ai == nil,
  claudecode = M.raw.nvim_ai == "claudecode",
  zellij_navigator = M.flags.in_zellij,
  osc11 = not M.flags.in_zellij,
}

-- LSP-specific environment paths
M.lsp = {
  vimruntime_lua = M.raw.vimruntime .. "/lua",
}

return M