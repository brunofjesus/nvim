return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		branch = "main",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
			{ "windwp/nvim-ts-autotag", config = true },
		},
		config = function()
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

			require("nvim-treesitter").setup({
				ensure_installed = parsers,
			})

			-- incremental selection
			vim.keymap.set("n", "<C-space>", function()
				require("nvim-treesitter.incremental_selection").init()
			end)
			vim.keymap.set("v", "<C-space>", function()
				require("nvim-treesitter.incremental_selection").increment()
			end)
			vim.keymap.set("v", "<bs>", function()
				require("nvim-treesitter.incremental_selection").decrement()
			end)
		end,
	},
}
