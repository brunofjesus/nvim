vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<tab>", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-tab>", "<cmd>bp<CR>", { desc = "Go to previous buffer" })

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
