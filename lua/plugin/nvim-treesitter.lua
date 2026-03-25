return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		branch = "master",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "master",
			},
			{ "windwp/nvim-ts-autotag", config = true },
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				-- enable indentation
				indent = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = (function()
					local parsers = {
						-- web
						"html",
						"css",
						"javascript",
						"typescript",
						"tsx",
						"graphql",
						-- data
						"json",
						"yaml",
						"markdown",
						"markdown_inline",
						-- scripting
						"lua",
						"bash",
						"vim",
						-- golang
						"go",
						"gomod",
						"templ",
						-- infra
						"dockerfile",
						"helm",
						"proto",
						-- other
						"gitignore",
						"query",
						"just",
						"mermaid",
					}
					if require("utils.env").should_load.php then
						table.insert(parsers, "php")
					end
					return parsers
				end)(),
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
