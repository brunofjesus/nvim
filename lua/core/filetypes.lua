-- disable Go ftplugin's ]] [[ mappings so snacks word-jump works
vim.g.no_go_maps = 1

local ft = vim.filetype -- for conciseness

ft.add {
  extension = {
  },
  filename = {
    ['Tiltfile'] = 'python',
  }
}
