# NeoVim Configuration

This NeoVim configuration is mostly used for GoLang coding.

## Keybindings

- NORMAL mode

```help
`<Esc>` - Clear search highlights
`<leader>sv` - Split window vertically
`<leader>sh` - Split window horizontally
`<leader>se` - Make splits equal size
`<leader>sd` - Close current buffer
`<leader>sx` - Close current split
`<tab>` - Go to next buffer
`<S-tab>` - Go to previous buffer
```

## Plugins

Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

### Bufferline
[akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
Shows buffers as "tabs" on the top portion of the editor

### Catppuccin
[catppuccin/nvim](https://github.com/catppuccin/nvim)
Applies the Catppuccin theme to NeoVim. Using the `mocha` flavor.

### Comment
[numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
Code commenting keybindings.

#### Keybindings

- NORMAL mode

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode
```

- VISUAL mode

```help
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

### Dressing
[stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)
UI improvements for selection and input dialogs.

### GitSigns
[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
Git decorations


#### Keybindings

- NORMAL mode

```help
`]c` - Go to next hunk
`[c` - Go to previous hunk
`<leader>hs` - Git stage hunk
`<leader>hr` - Git reset hunk
`<leader>hS` - Git stage buffer
`<leader>hu` - Git undo stage hunk
`<leader>hR` - Git reset buffer
`<leader>hp` - Git preview hunk
`<leader>hb` - Git blame line
`<leader>hd` - Git diff
`<leader>hD` - Git diff HEAD
`<leader>td` - Toggle deleted
`<leader>tb` - Toggle current line blame
```

- VISUAL mode
```help
`<leader>hs` - Git stage hunk
`<leader>hr` - Git reset hunk
```

### Indent-blankline
[lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
Adds indentation guides.

### Lualine
[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
Status line

### nvim-cmp
[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Completion engine for neovim.

#### Completion sources

- neovim/nvim-lspconfig
- hrsh7th/cmp-buffer
- hrsh7th/cmp-path
- hrsh7th/cmp-nvim-lsp
- hrsh7th/cmp-cmdline
- hrsh7th/cmp-nvim-lua
- L3MON4D3/LuaSnip
- saadparwaiz1/cmp_luasnip
- rafamadriz/friendly-snippets

#### Keybindings

- INSERT mode

```help
`<C-k>` - Select previous item
`<C-j>` - Select next item
`<C-b>` - Scroll docs ( -4 )
`<C-f>` - Scroll docs ( +4 )
`<C-Space>` - Complete
`<C-e>` - Abort
`<CR>` - Confirm
```

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

### outline.nvim
[hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim)
Outline explorer sidebar

#### Keybindings

- NORMAL mode

```help
`<leader>o` - Toggle outline
```

### telescope.nvim
[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim/tree/0.1.x)

Fuzzy finder.

Requires `fzf` and `ripgrep`.

#### Keybindings

- NORMAL mode

```help
`<leader>ff` - Find files in current working directory
`<leader>fr` - Find recent files
`<leader>fs` - Find string in current working directory
`<leader>fc` - Find string under cursor in the current working directory
`<leader>fb` - Find buffers
`<leader>fe` - Find emoji
`<leader>fgm` - Find git commits
`<leader>fgs` - Find git status
```

- On Fuzzy Finder
```help
`<C-k>` - Move to previous result (up)
`<C-j>` - Move to next result (down)
`<C-q>` - Send to qflist
`<C-6> or <C-^> - telescope-menufacture (only for ff/fr/fs/fc)
```

### vim-maximizer
[szw/vim-maximizer](https://github.com/szw/vim-maximizer)
Maximizes and restores the current window in Vim.

#### Keybindings

- NORMAL mode

```help
`<leader>sm` - Toggle maximizer
`<F3>` - Toggle maximizer
```

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
- tsserver
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
   - tsserver
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

