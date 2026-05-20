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
				"gotmpl",
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

			require("nvim-treesitter").install(parsers)

			local notified = {}
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = vim.bo[args.buf].filetype
					-- skip non-file buffers (pickers, dapui, terminals, prompts) — only real files have buftype == ""
					if ft == "" or vim.bo[args.buf].buftype ~= "" then return end
					local ok = pcall(vim.treesitter.start, args.buf)
					if not ok and not notified[ft] then
						notified[ft] = true
						vim.notify("no treesitter parser for filetype: " .. ft, vim.log.levels.WARN)
					end
				end,
			})
		end,
	},
}
