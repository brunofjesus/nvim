return {
	"szw/vim-maximizer",
  config = function ()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<cr>", { desc = "Maximize Toggle" })
  end,
}
