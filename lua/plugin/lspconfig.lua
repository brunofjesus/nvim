return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true }, -- TODO: check if this is necessary
   'saghen/blink.cmp',
  },
  config = function()
    local lspconfig = require("lspconfig")
    local lsputil = require("lspconfig/util")

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Format current file"
      keymap.set("n", "gf", vim.lsp.buf.format, opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = ' ',
                [vim.diagnostic.severity.WARN] = ' ',
                [vim.diagnostic.severity.HINT] = '󰠠 ',
                [vim.diagnostic.severity.INFO] = ' ',
            },
            linehl = {
                [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                [vim.diagnostic.severity.WARN] = 'WarningMsg',
                [vim.diagnostic.severity.HINT] = 'HintMsg',
                [vim.diagnostic.severity.INFO] = 'InfoMsg',
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                [vim.diagnostic.severity.WARN] = 'WarningMsg',
                [vim.diagnostic.severity.HINT] = 'HintMsg',
                [vim.diagnostic.severity.INFO] = 'InfoMsg',
            },
        },
    })

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure graphql language server
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
    -- configure golang
    lspconfig["gopls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
      root_dir = lsputil.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = false,
          gofumpt = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
          }
        }
      }
    })

    -- golang templ
    lspconfig["templ"].setup({
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    })
    vim.filetype.add({
      extension = {
        templ = "templ",
      },
    })
  end,
}
