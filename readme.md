# NeoVim Configuration

## Warning
I'm trying new key combinations, so this might be outdated `<leader>sk` will open all keybindings.

This NeoVim configuration is mostly used for GoLang coding.

## Keybindings

- NORMAL mode

```help
`<Esc>` - Clear search highlights
`<tab>` - Go to next buffer
`<S-tab>` - Go to previous buffer
`<leader>wv` - Split window vertically
`<leader>wh` - Split window horizontally
`<leader>we` - Make splits equal size
`<leader>wd` - Delete buffer
`<leader>wo` - Delete other buffers
`<leader>wa` - Delete all buffers
`<leader>wx` - Close current split
`<leader>z` - Toggle zen mode
`<leader>Z` - Toggle zen zoom mode
`<leader>.` - Toggle scratch buffer
`<leader>S` - Select scratch buffer
`<leader>n` - Notification history
`<leader>un` - Dismiss all notifications`
`<leader>cR` - Rename file 
`<leader>gB` - Git browse
`<leader>gb` - Git blame line
`<leader>gf` - Lazygit current file history`
`<leader>gg` - Lazygit`
`<leader>gl` - Lagygit log`
`<C-/>` - Toggle Terminal
`<leader>us` - Toggle spelling
`<leader>uw` - Toggle wrap
`<leader>ul` - Toggle line number
`<leader>uL` - Toggle relative number
`<leader>uc` - Toggle conceal
`<leader>uT` - Toggle Treesitter highlight
`<leader>ub` - Toggle dark theme
`<leader>uh` - Toggle inlay hints
`<leader>ug` - Toggle indent
`<leader>uD` - Toggle dim
```

## Plugins

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

### Bufferline
[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
Shows buffers as "tabs" on the top portion of the editor

### Catppuccin
[catppuccin/nvim](https://github.com/catppuccin/nvim)
Applies the Catppuccin theme to NeoVim. Using the `mocha` flavor.

### GitSigns
[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
Git decorations

### Lualine
[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
Status line

### blink-cmp
[Saghen/blink.cmp](https://github.com/Saghen/blink.cmp)

Completion engine for neovim.

#### Keybindings

- INSERT mode

### nvim-tree
[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
File explorer for Neovim

#### Keybindings

- NORMAL mode

```help
`<C-n>` - Show/Hide the tree
`<leader>ef` - Find the current open file in the tree
`<leader>ec` - Collapse the tree recursively
`<leader>er` - Refresh the tree
```

### nvim-treesiter
[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
Treesiter integration for Neovim

#### Parsers
 - json
 - javascript
 - typescript
 - tsx
 - yaml
 - html
 - css
 - markdown
 - markdown_inline
 - graphql
 - bash
 - lua
 - vim
 - dockerfile
 - gitignore
 - query
 - go
 - templ

### vim-tmux-navigator
[christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
Provides mappings which allow moving between vim panes and tmux splits seamlessly.

#### Keybindings

- NORMAL mode

```help
`<C-h>` - Navigate left
`<C-j>` - Navigate down
`<C-k>` - Navigate up
`<C-l>` - Navigate right
`<C-\>` - Navigate previous
```

### which-key.nvim
[folke/which-key.nvim](https://github.com/folke/which-key.nvim)
Displays a popup with possible key bindings of the command you started typing

### nvim-lspconfig
[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
Official Neovim LSP Config

#### Sources
- hrsh7th/cmp-nvim-lsp

#### Other dependencies
- antosha417/nvim-lsp-file-operations

#### LSP configurations
- html
- ts_ls
- cssls
- graphql
- emmet_ls
- lua_ls
- gopls
- templ

#### Keybindings

- NORMAL mode

```help
`gR` - Show LSP references
`gD` - Go to declaration
`gd` - Show LSP definitions
`gi` - Show LSP implementations
`gt` - Show LSP type definitions
`gf` - Format current file
`[d` - Go to previous diagnostic
`]d` - Go to next diagnostic
`K` - Show documentation for what is under cursor
`<leader>ca` - See available code actions
`<leader>rn` - Smart rename
`<leader>D` - Show buffer diagnostics
`<leader>d` - Show line diagnostics
`<leader>rs` - Restart LSP
```

### mason
[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
Package manager for neovim

Installs the following tools:

- LSP
   - ts_ls
   - html
   - cssls
   - lua_ls
   - graphql
   - emmet_ls
- Tools
   - prettier
   - stylua
   - eslint_d
   - gopls
   - gofumpt
   - golines
   - gotests
   - delve

### nvim-dap
[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
Debug Adapter Procotol (DAP) client for Neovim.

#### Keybindings

- NORMAL mode

```help
`<F5>` - DAP Continue
`<F2>` - DAP Step Over
`<F3>` - DAP Step Into
`<F4>` - DAP Step Out
`<F8>` - DAP Run To Cursor
`<F10>` - DAP Terminate
`<leader>db` - DAP Toggle Breakpoint
`<leader>dB` - DAP Set Breakpoint
```

### nvim-dap-ui
[rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
UI for `nvim-dap`.

### nvim-dap-go
[leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)
Extension to `nvim-dap` providing compatibility with the `go debugger` (`delve`). 

#### Keybindings

- NORMAL mode

```help
`<leader>dgt` - Debug Test
`<leader>dgl` - Debug Last Test
```

### avante
[yetone/avante.nvim](https://github.com/yetone/avante.nvim)
Cursor AI like plugin for neovim

#### Keybindings

- NORMAL mode

```help
<leader>aa	Show Sidebar
<leader>ar	Refresh Sidebar
<leader>af	Switch Sidebar Focus
<leader>ae	Edit Selected Blocks
co	Choose Ours
ct	Choose Theirs
ca	Choose All Theirs
c0	Choose None
cb	Choose Both
cc	Choose Cursor
]x	Move To Previous Conflict
[x	Move To Next Conflict
[[	Jump To Previous Codeblocks (Results Window)
]]	Jump To Next Codeblocks (Results Windows)
```

### snacks.nvim
[folke/snacks.nvim](https://github.com/folke/snacks.nvim)
A collection of small QoL plugins for Neovim.
