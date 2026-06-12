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
			-- Register the custom godoc parser BEFORE install() so it can be
			-- installed alongside the built-in parsers. main-branch install_info
			-- schema (no `files`/`version`).
			local godoc_parser = {
				install_info = {
					url = "https://github.com/fredrikaverpil/tree-sitter-godoc",
					-- revision = "<sha>", -- optional: pin a commit; HEAD if omitted
				},
			}
			require("nvim-treesitter.parsers").godoc = godoc_parser
			-- Re-register after :TSUpdate so it survives parser-list reloads.
			vim.api.nvim_create_autocmd("User", {
				pattern = "TSUpdate",
				callback = function()
					require("nvim-treesitter.parsers").godoc = godoc_parser
				end,
			})

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
				"godoc",
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
					-- exception: :GoDoc renders into a scratch buffer (buftype=nofile) we still want highlighted
					if ft == "" or (vim.bo[args.buf].buftype ~= "" and ft ~= "godoc") then return end
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
