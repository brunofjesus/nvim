return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
      options = {
        theme = "catppuccin",
        section_separators = { left = '', right = '' }, -- Rounded separators
        component_separators = { left = '', right = '' }, -- Smaller rounded separators
      },
      sections = {
        lualine_c = {
          {
            'filename',
            filestatus = true,
            path = 1,
          }
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
