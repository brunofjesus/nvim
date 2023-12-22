local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
    "neovim/nvim-lspconfig",
		"hrsh7th/cmp-buffer", -- source for text buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
    -- LuaSnip
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- autocompletion

    -- General Snippets
    "rafamadriz/friendly-snippets", -- general purpose snippets
	},
}

M.config = function()
	local cmp = require("cmp")
  local luasnip = require("luasnip")

  -- load vscode style snippets from `friendly-snippets`
  require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
    completion = {
      completeopt = "menu,menuone,preview,noselect",
    },
		snippet = { -- configure how nvim-cmp interacts with snippet engine
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M

