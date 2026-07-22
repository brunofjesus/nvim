vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function(args)
    vim.keymap.set('n', '<leader>mr', '<cmd>RenderMarkdown buf_toggle<cr>',
      { buffer = args.buf, desc = 'Toggle render-markdown for current buffer' })
  end,
})

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = true,
      anti_conceal = {
        --enabled = false,
        --disabled_modes = {"n"},
      },
    },
}
