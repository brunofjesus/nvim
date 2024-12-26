return {
  "catppuccin/nvim",
  name = "catppuccin",
  dependencies = { "rasulomaroff/reactive.nvim" },
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
      term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,              -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,            -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,              -- Force no italic
      no_bold = false,                -- Force no bold
      no_underline = false,           -- Force no underline
      styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },      -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.subtext1 },
          CursorLineNr = { fg = colors.peach, bg = colors.overlay0 },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        dap = true,
        dap_ui = true,
        snacks = true,
        render_markdown = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        telescope = {
          enabled = true,
          style = "nvchad"
        },
        indent_blankline = {
          enabled = true,
          scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        -- For more plugins integrations (https://github.com/catppuccin/nvim#integrations)
      },
    })

    require('reactive').setup {
      load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' }
    }
    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end,
}
