vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("t", "<esc><esc>", "<C-\\><c-n>", {})

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Navigate to left-most and right-most splits
keymap.set("n", "<A-h>", "<cmd>wincmd t<CR>", { desc = "Go to far left split" })
keymap.set("n", "<A-l>", "<cmd>wincmd b<CR>", { desc = "Go to far right split" })

-- Git workflows
keymap.set("n", "<leader>gw", "<cmd>GitHubWorkflows<CR>", { desc = "List GitHub workflows" })
