return {
  "nickkadutskyi/jb.nvim",
  dependencies = { "rasulomaroff/reactive.nvim" },
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- require("jb").setup({transparent = true})
    vim.cmd("colorscheme jb")
  end,
}
