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
          -- base = "#000000",
          -- mantle = "#000000",
          -- crust = "#000000",
        },
      },
      custom_highlights = function(colors)
        local O = require("catppuccin").options
        return {
          LineNr = { fg = colors.subtext1 },
          -- CursorLineNr = { fg = colors.pink , bg = colors.overlay0 },
          DapStopped =  { fg = colors.crust, bg = "#CD7B91" },
          -- Restore previous version behaviour 
          -- https://github.com/catppuccin/nvim/pull/804#pullrequestreview-3080755868
          ["@variable.member"] = { fg = colors.lavender }, -- For fields.
          ["@module"] = { fg = colors.lavender, style = O.styles.miscs or { "italic" } }, -- For identifiers referring to modules and namespaces.
          ["@string.special.url"] = { fg = colors.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
          ["@type.builtin"] = { fg = colors.yellow, style = O.styles.properties or { "italic" } }, -- For builtin types.
          ["@property"] = { fg = colors.lavender, style = O.styles.properties or {} }, -- Same as TSField.
          ["@constructor"] = { fg = colors.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
          ["@keyword.operator"] = { link = "Operator" }, -- For new keyword operator
          ["@keyword.export"] = { fg = colors.sky, style = O.styles.keywords },
          ["@markup.strong"] = { fg = colors.maroon, style = { "bold" } }, -- bold
          ["@markup.italic"] = { fg = colors.maroon, style = { "italic" } }, -- italic
          ["@markup.heading"] = { fg = colors.blue, style = { "bold" } }, -- titles like: # Example
          ["@markup.quote"] = { fg = colors.maroon, style = { "bold" } }, -- block quotes
          ["@markup.link"] = { link = "Tag" }, -- text references, footnotes, citations, etc.
          ["@markup.link.label"] = { link = "Label" }, -- link, reference descriptions
          ["@markup.link.url"] = { fg = colors.rosewater, style = { "italic", "underline" } }, -- urls, links and emails
          ["@markup.raw"] = { fg = colors.teal }, -- used for inline code in markdown and for doc in python (""")
          ["@markup.list"] = { link = "Special" },
          ["@tag"] = { fg = colors.mauve }, -- Tags like html tag names.
          ["@tag.attribute"] = { fg = colors.teal, style = O.styles.miscs or { "italic" } }, -- Tags like html tag names.
          ["@tag.delimiter"] = { fg = colors.sky }, -- Tag delimiter like < > /
          ["@property.css"] = { fg = colors.lavender },
          ["@property.id.css"] = { fg = colors.blue },
          ["@type.tag.css"] = { fg = colors.mauve },
          ["@string.plain.css"] = { fg = colors.peach },
          ["@constructor.lua"] = { fg = colors.flamingo }, -- For constructor calls and definitions: = { } in Lua.
          -- typescript
          ["@property.typescript"] = { fg = colors.lavender, style = O.styles.properties or {} },
          ["@constructor.typescript"] = { fg = colors.lavender },
          -- TSX (Typescript React)
          ["@constructor.tsx"] = { fg = colors.lavender },
          ["@tag.attribute.tsx"] = { fg = colors.teal, style = O.styles.miscs or { "italic" } },
          ["@type.builtin.c"] = { fg = colors.yellow, style = {} },
          ["@type.builtin.cpp"] = { fg = colors.yellow, style = {} },
        }
      end,
      integrations = {
        cmp = false,
        nvimtree = false,
        blink_cmp = true,
        gitsigns = true,
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
