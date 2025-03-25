return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  init = function()
    vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" });
    vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" });
    vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "Create new tab" });
    vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" });
    vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" });
  end,
  opts = {
    options = {
      mode = "buffer",
      separator_style = "thin",
      diagnostics = "nvim_lsp"
    }
  },
}
