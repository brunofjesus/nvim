return {
	"fredrikaverpil/godoc.nvim",
	version = "*",
	dependencies = {
		{ "folke/snacks.nvim" }, -- optional
		{ "nvim-treesitter/nvim-treesitter" },
	},
	init = function()
		vim.keymap.set("n", "<leader>sG", ":GoDoc<CR>", { desc = "GoDoc" }) -- split window vertically

		-- Map the godoc filetype to the godoc tree-sitter parser. The parser itself
		-- is registered/installed in lua/plugin/nvim-treesitter.lua before install().
		vim.treesitter.language.register("godoc", "godoc")

		-- Use the godoc filetype for `.godoc` files
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = "*.godoc",
			callback = function()
				vim.bo.filetype = "godoc"
			end,
		})
	end,
	build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
	cmd = { "GoDoc" },
	opts = {
		adapters = {
			{
				name = "go",
				opts = {
					command = "GoDoc", -- the desired Vim command to use
					-- Use the godoc tree-sitter parser for syntax highlighting
					get_syntax_info = function()
						return {
							filetype = "godoc",
							language = "godoc",
						}
					end,
				},
			},
		},
		window = {
			type = "split", -- split or vsplit
		},
		picker = {
			type = "snacks", -- native, telescope, snacks, mini or fzf_lua
			snacks = {
				layout = {
					layout = {
						height = 0.8,
						width = 0.9, -- Take up 90% of the total width (adjust as needed)
						box = "horizontal", -- Horizontal layout (input and list on the left, preview on the right)
						{ -- Left side (input and list)
							box = "vertical",
							width = 0.3, -- List and input take up 30% of the width
							border = "rounded",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", border = "rounded", width = 0.7 }, -- Preview window takes up 70% of the width
					},
				},
				win = {
					preview = {
						wo = { wrap = true },
					},
				},
			},
		},
	},
}
