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

-- Terminal
keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>", { desc = "Drop to normal mode"})

-- Git workflows
keymap.set("n", "<leader>gw", "<cmd>GitHubWorkflows<CR>", { desc = "List GitHub workflows" })


local in_zellij = vim.env.ZELLIJ ~= nil
local in_tmux = vim.env.TMUX ~= nil
if not (in_zellij or in_tmux) then
  keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Go to left split" })
  keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Go to down split" })
  keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Go to up split" })
  keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Go to right split" })

  keymap.set("n", "<C-w>h", "<nop>")
  keymap.set("n", "<C-w>j", "<nop>")
  keymap.set("n", "<C-w>k", "<nop>")
  keymap.set("n", "<C-w>l", "<nop>")
end
