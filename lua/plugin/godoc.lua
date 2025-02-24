return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
        { "folke/snacks.nvim" }, -- optional
        {
            "nvim-treesitter/nvim-treesitter",
            opts = {
              ensure_installed = { "go" },
            },
        },
    },
    init = function()
      local keymap = vim.keymap
      keymap.set("n", "<leader>sG", ":GoDoc<CR>", { desc = "GoDoc" }) -- split window vertically

    end,
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" },
    opts = {
      command = "GoDoc", -- the desired Vim command to use
      window = {
          type = "split", -- split or vsplit
      },
      highlighting = {
          language = "go", -- the tree-sitter parser used for syntax highlighting
      },
      picker = {
          type = "snacks", -- native, telescope or snacks
          snacks_options = {
              layout = {
                  layout = {
                      height = 0.8,
                      width = 0.9, -- Take up 90% of the total width (adjust as needed)
                      box = "horizontal", -- Horizontal layout (input and list on the left, preview on the right)
                      { -- Left side (input and list)
                          box = "vertical",
                          width = 0.3, -- List and input take up 30% of the width
                          border = "rounded",
                          { win = "input", height = 1, border = "bottom" },
                          { win = "list", border = "none" },
                      },
                      { win = "preview", border = "rounded", width = 0.7 }, -- Preview window takes up 70% of the width
                  },
              },
              win = {
                  preview = {
                      wo = { wrap = true },
                  },
              },
          },
      },
    },
}
