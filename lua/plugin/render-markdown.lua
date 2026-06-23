return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = false, -- off by default; per-buffer via :RenderMarkdown buf_toggle
      anti_conceal = {
        --enabled = false,
        disabled_modes = {"n"},
      },
      -- let markdown-table-wrap.nvim handle pipe tables
      pipe_table = { enabled = false },
    },
}
