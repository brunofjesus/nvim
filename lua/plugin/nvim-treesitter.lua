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
				init = function()
					-- Disable entire built-in ftplugin mappings to avoid conflicts.
					-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
					vim.g.no_plugin_maps = true
				end,
				config = function()
					require("nvim-treesitter-textobjects").setup({
						select = {
							lookahead = true,
							selection_modes = {
								["@parameter.outer"] = "v",
								["@function.outer"] = "V",
								["@class.outer"] = "<C-v>",
							},
							include_surrounding_whitespace = false,
						},
					})

					vim.keymap.set({ "n", "x", "o" }, "<C-space>", function()
						require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
					end)
					vim.keymap.set({ "n", "x", "o" }, "<bs>", function()
						require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
					end)
				end,
			},
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter")

			treesitter.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			treesitter.install({
				"json",
				"jsonc",
				"xml",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"dockerfile",
				"gitignore",
				"query",
				"go",
				"templ",
				"gomod",
				"just",
				"helm",
				"proto",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "typescript" },
				callback = function(ev)
					--local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
          local ft = ev.match

					if not have(ft) then
						return
					end
					pcall(vim.treesitter.start, ev.buf)
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			local _installed = nil ---@type table<string,boolean>?
			local _queries = {} ---@type table<string,boolean>-

			---@param update boolean?
			function get_installed(update)
				if update then
					_installed, _queries = {}, {}
					for _, lang in ipairs(require("nvim-treesitter").get_installed("parsers")) do
						_installed[lang] = true
					end
				end
				return _installed or {}
			end

			get_installed(true) -- populate --installed on startup

			---@param lang string
			---@param query string
			function have_query(lang, query)
				local key = lang .. ":" .. query
				if _queries[key] == nil then
					_queries[key] = vim.treesitter.query.get(lang, query) ~= nil
				end
				return _queries[key]
			end

			---@param what string|number|nil
			---@param query? string
			---@overload fun(buf?:number):boolean
			---@overload fun(ft:string):boolean
			---@return boolean
			function have(what, query)
				what = what or vim.api.nvim_get_current_buf()
				what = type(what) == "number" and vim.bo[what].filetype or what --[[@as string]]
				local lang = vim.treesitter.language.get_lang(what)
				if lang == nil or get_installed()[lang] == nil then
					return false
				end
				if query and not have_query(lang, query) then
					return false
				end
				return true
			end
		end,
	},
}
