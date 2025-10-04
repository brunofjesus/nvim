return {
	"vim-test/vim-test",
  dependencies =  {
    "preservim/vimux",
  },
	vim.keymap.set("n", "<leader>dgn", ":TestNearest<CR>"),
	vim.keymap.set("n", "<leader>dgf", ":TestFile<CR>"),
	vim.keymap.set("n", "<leader>dgs", ":TestSuite<CR>"),
	vim.keymap.set("n", "<leader>dgl", ":TestLast<CR>"),
	vim.keymap.set("n", "<leader>dgv", ":TestVisit<CR>"),
  vim.cmd("let test#strategy = \"vimux\"")
}
