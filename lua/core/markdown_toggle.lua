vim.api.nvim_create_user_command(
  'MarkdownToggle',
  function()
    vim.cmd('RenderMarkdown buf_toggle')      -- render-markdown.nvim, current buffer
    vim.cmd('MarkdownTableToggleAutoPreview')  -- markdown-table-wrap.nvim, current buffer
  end,
  { desc = 'Toggle markdown rendering (render-markdown + table-wrap) for current buffer' }
)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function(args)
    vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownToggle<cr>',
      { buffer = args.buf, desc = 'Toggle markdown rendering' })
  end,
})
