local formatters_by_ft = {
  javascript = { "prettier" },
  typescript = { "prettier" },
  javascriptreact = { "prettier" },
  typescriptreact = { "prettier" },
  json = { "prettier" },
  yaml = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  markdown = { "prettier" },
  lua = { "stylua" },
}

if require("utils.env").should_load.php then
  formatters_by_ft.php = { "phpcbf" }
end

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = formatters_by_ft,
  },
}
