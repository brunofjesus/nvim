local env = require("utils.env")

return {
	"NickvanDyke/opencode.nvim",
	enabled = env.should_load.opencode,
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for default `toggle()` implementation.
		-- { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		local opencode_cmd = "opencode"
		---@type snacks.terminal.Opts
		local snacks_terminal_opts = {
			win = {
				position = "right",
				style = "minimal",
				enter = false,
			},
		}
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
			events = {
				enabled = true,
				reload = {
					enabled = true,
				},
				permissions = {
					enabled = true,
					edits = {
						enabled = true, -- open diff buffer
					},
				},
			},
			server = {
				start = function()
					require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
				end,
			},
		}

		-- Recommended/example keymaps.
		local opencode = require("opencode")
		vim.keymap.set({ "n", "x", "v" }, "<leader>a", "", { desc = "AI/Opencode" })

		vim.keymap.set({ "n", "x" }, "<C-a>", function()
			opencode.ask("@this: ")
		end, { desc = "Ask opencode" })

		vim.keymap.set({ "n", "x" }, "<C-x>", function()
			opencode.select()
		end, { desc = "Execute opencode action…" })

		vim.keymap.set({ "n", "x" }, "<leader>as", function()
			return opencode.operator("@this")
		end, { desc = "Add to opencode", expr = true })

		vim.keymap.set("n", "<leader>ass", function()
			return opencode.operator("@this") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		-- NOTE: keep this out of 't' (terminal) mode. <leader> is <space>, so mapping
		-- <leader>ac in terminal mode makes Neovim wait 'timeoutlen' on every <space>
		-- press in terminal buffers, causing sluggish space. Use <C-.> to toggle from
		-- terminal mode instead. (Regression previously fixed in ea8b22a.)
		vim.keymap.set({ "n" }, "<leader>ac", function()
			require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "t" }, "<C-.>", function()
			require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
		end, { desc = "Toggle opencode" })
	end,
}
