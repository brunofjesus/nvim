-- disable Go ftplugin's ]] [[ mappings so snacks word-jump works
vim.g.no_go_maps = 1

local ft = vim.filetype -- for conciseness

ft.add {
  extension = {
  },
  pattern = {
    ['.*templates/.+%.yaml'] = 'helm',
    ['.*templates/.+%.yml'] = 'helm',
    ['.*templates/.+%.tpl'] = 'helm',
    ['helmfile.*%.yaml'] = 'helm',
  },
  filename = {
    ['Tiltfile'] = 'python',
  }
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "helm",
  callback = function(args)
    vim.schedule(function()
      vim.treesitter.stop(args.buf)
      vim.bo[args.buf].syntax = "yaml"
    end)
  end,
})
