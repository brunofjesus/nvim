vim.g.mapleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sd", "<cmd>bd<CR>", { desc = "Close current buffer" }) -- close current buffer
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window


keymap.set("n", "<tab>", "<cmd>bn<CR>", { desc = "Go to next buffer" }) -- open new tab
keymap.set("n", "<S-tab>", "<cmd>bp<CR>", { desc = "Go to previous buffer" }) -- open new tab
