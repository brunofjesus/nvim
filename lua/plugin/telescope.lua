return {
  "nvim-telescope/telescope.nvim",
  enabled = false,
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-symbols.nvim",
    "molecule-man/telescope-menufacture",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local menufacture = telescope.extensions.menufacture

    keymap.set("n", "<leader>ff", menufacture.find_files, { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", menufacture.oldfiles, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", menufacture.live_grep, { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", menufacture.grep_string, { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fe", "<cmd>Telescope symbols<cr>", { desc = "Find emoji" })
  end,
}
