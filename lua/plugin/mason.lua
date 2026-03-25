local env = require("utils.env")

local ensure_installed = {
  -- NOTE: LSP server names here use mason registry names, which differ from
  -- lspconfig names (e.g., "html-lsp" here vs "html" in lspconfig).
  -- mason-lspconfig used to handle this mapping, but since we use
  -- mason-tool-installer directly, we need the mason registry names.

  -- lsp servers: web
  "html-lsp",
  "css-lsp",
  "typescript-language-server",
  "graphql-language-service-cli",
  "emmet-ls",
  -- lsp servers: data
  "json-lsp",
  "yaml-language-server",
  "marksman",
  -- lsp servers: scripting
  "lua-language-server",
  "bash-language-server",
  -- lsp servers: golang
  "gopls",
  "templ",
  -- lsp servers: infra
  "dockerfile-language-server",
  "helm-ls",
  "buf",
  -- formatters
  "prettier",
  "stylua",
  -- linters
  "eslint_d",
  -- golang tools
  "gofumpt",
  "gotests",
  "delve",
  "golangci-lint",
  -- diagrams
  "mmdc",
}

if env.should_load.php then
  vim.list_extend(ensure_installed, {
    -- php
    "intelephense",
    "phpcs",
    "phpcbf",
    "phpstan",
  })
end

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
  },
  opts = {
    ensure_installed = ensure_installed,
  },
}
