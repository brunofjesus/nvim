vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function(args)
    vim.keymap.set('n', '<leader>umr', '<cmd>RenderMarkdown buf_toggle<cr>',
      { buffer = args.buf, desc = 'Toggle render-markdown for current buffer' })
    vim.keymap.set('n', '<leader>umt', '<cmd>MarkdownTableToggleAutoPreview<cr>',
      { buffer = args.buf, desc = 'Toggle markdown table auto preview' })
  end,
})
