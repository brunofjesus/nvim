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
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
			events = {
				enabled = true,
				reload = true,
				permissions = {
					enabled = true,
					idle_delay_ms = 1000,
					edits = {
						enabled = true, -- open diff buffer
					},
				},
			},
		}

		-- Required for `opts.auto_reload`.
		vim.o.autoread = true

		-- Recommended/example keymaps.
    local opencode = require("opencode")
    vim.keymap.set({ "n", "x", "v" }, "<leader>a", "", { desc = "AI/Opencode" })
		vim.keymap.set({ "n", "x" }, "<C-a>", function() opencode.ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
		vim.keymap.set({ "n", "x" }, "<C-x>", function() opencode.select() end, { desc = "Execute opencode action…" })
		vim.keymap.set({ "n", "x" }, "<leader>as", function() opencode.prompt("@this") end, { desc = "Add to opencode" })
		vim.keymap.set({ "n", "t" }, "<C-.>", function() opencode.toggle() end, { desc = "Toggle opencode" })
		vim.keymap.set("n", "<S-C-u>", function() opencode.command("session.half.page.up") end, { desc = "opencode half page up" })
		vim.keymap.set("n", "<S-C-d>", function() opencode.command("session.half.page.down") end, { desc = "opencode half page down" })
	end,
}
